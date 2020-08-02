class V1::Resources::TodoItems < Grape::API
  resources :todo_items do

    # GET /api/v1/todo_items
    desc '一覧取得'
    get do
      present TodoItem.all
    end

    # GET /api/v1/todo_items/{:id}
    desc '一件取得'
    params do
      requires :id, type: Integer, desc: 'todoリストID'
    end
    get ':id' do
      TodoItem.find(params[:id])
    end

    # POST /api/v1/todo_items
    desc '作成'
    params do
      requires :text, type: String, desc: 'テキスト'
    end
    post do
      item = TodoItem.create(text: params[:text])
      present item
    rescue StandardError => e
      Rails.logger.error(e)
    end

    # DELETE /api/v1/todo_items/:id
    desc '削除'
    params do
      requires :id, type: Integer, desc: 'todoリストID'
    end
    delete ':id' do
      item = TodoItem.find(params[:id])
      item.destroy
    rescue StandardError => e
      Rails.logger.error(e)
      present 'Not found'
    end

    # PATCH /api/v1/todo_items/:id
    desc '更新'
    params do
      requires :id, type: Integer, desc: 'todoリストID'
      requires :text, type: String, desc: 'テキスト'
    end
    patch ':id' do
      item = TodoItem.find(params[:id])
      item.update(text: params[:text])
      present item
    rescue StandardError => e
      Rails.logger.error(e)
      present 'Not found'
    end

  end
end
