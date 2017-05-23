# frozen_string_literal: true

class Api::V1::TagsController < ApiController
  respond_to :json

  def trend
    limit_size = params[:limit] || 3
    limit = limit_size.to_i.clamp(0, 10)

    from = 1.days.ago

    # from の日時以降に出現数の多いタグ上位を limit 数分抽出
    @tags = Tag.joins(:statuses)
                .select('tags.*,count(statuses.id) as count_statuses_id')
                .where(statuses: {created_at: from...Time.current})
                .group(:id)
                .order('count_statuses_id desc')
                .limit(limit)
  end
end
