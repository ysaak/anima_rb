class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index

    @entity_type = EntityType.find(params[:type])

    @letters = Entity.letters(params[:type])

    if not params[:letter].blank?
      @letter = params[:letter]
    else
      if @letters.empty?
        @letter = '#'
      else
        @letter = @letters.first
      end
    end

    if @letter == '#'
      clause = '[^A-Z]'
    else
      clause = @letter
    end

    @entities = Entity.where('entity_type_id = ? AND UPPER(LEFT(title,1)) REGEXP ?', params[:type], clause).order('title')
  end

  # GET /search
  def search
    if not params[:query].blank?

      clause = ''

      if params[:query].kind_of? Array
        entry = []
        for e in params[:query] do
          entry << Regexp.escape(e.upcase)
        end

        clause = entry.join('|')
      else
        clause = params[:query]
      end

      @entities = Entity.where('UPPER(title) REGEXP ?', clause).order('title')
    else
      @entities = []
    end

    if @entities.length == 1
      entity = @entities[0]
      redirect_to send(entity.entity_type.view_path, entity.id)
    end
  end

  def search_suggests
    if not params[:query].blank?
      @entities = Entity.where('UPPER(title) LIKE ?', '%' + params[:query] + '%').order('title')
    end
  end

  # GET /entities/1
  # GET /entities/1.json
  def show

    @entity = Entity.find(params[:id])

    # Relations
    @relations = {}

    if @entity.relations.present?

      @entity.relations.each do | relation |

        if not @relations.include? relation.relation_id
          @relations[relation.relation_id] = {
              'relation' => relation.relation,
              'entities' => []
          }
        end

        @relations[relation.relation_id]['entities'] << relation.related_entity
      end

      # Sort relations

      @relations.each do | relation |

        relation[1]['entities'].sort! { | a,b | a.title <=> b.title }

      end
    end

    # Storage
    @storages = Storage.find_by_entity(@entity.id)
    @locations = Location.all.index_by(&:id)
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = Entity.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity, notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:entity_type, :entity_sub_type, :collection, :title, :synopsis, :seasons, :episodes, :year)
    end
end
