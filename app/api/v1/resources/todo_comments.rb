class V1::Resources::TodoComments < Grape::API
  resources :todo_comments do

    # GET /api/v1/todo_comments
    desc '一覧取得'
    get do
      present TodoComment.all
    end

    # POST /api/v1/todo_comments
    desc '作成'
    params do
      requires :todo_item, type: TodoItem, desc: '対象のtodoアイテム'
      requires :text, type: String, desc: 'テキスト'
    end
    post do
      comment = TodoComment.create(todo_item: params[:todo_item], text: params[:text])
      present comment
    rescue StandardError => e
      Rails.logger.error(e)
    end

    # DELETE /api/v1/todo_comments/:id
    desc '削除'
    params do
      requires :id, type: Integer, desc: 'コメントID'
    end
    delete ':id' do
      item = TodoComment.find(params[:id])
      item.destroy
    rescue StandardError => e
      Rails.logger.error(e)
      present 'Not found'
    end

    # PATCH /api/v1/todo_comments/:id
    desc '更新'
    params do
      requires :id, type: Integer, desc: 'コメントID'
      requires :text, type: String, desc: 'テキスト'
    end
    patch ':id' do
      item = TodoComment.find(params[:id])
      item.update(text: params[:text])
      present item
    rescue StandardError => e
      Rails.logger.error(e)
      present 'Not found'
    end

    # DELETE /api/v1/todo_comments/todo_items/:id
    desc '任意のtodoアイテムに紐づくコメント一括削除'
    params do
      requires :id, type: Integer, desc: 'todoリストID'
    end
    delete '/todo_items/:id' do
      TodoComment.where(todo_item_id: params[:id]).delete_all
    rescue StandardError => e
      Rails.logger.error(e)
      present 'some error'
    end

  end
end
