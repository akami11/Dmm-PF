class SortsController < ApplicationController
   before_action :tip_view, only: [:sort]
  
  def sort
    @nutrition = params["nutrition"]
    @updown = params["updown"]
    @conclude = sort_for(@nutrition,@updown).page(params[:page]).per(12)
    @categories = Category.all
  end
  
  # ソート機能やり方は検索機能と同じ、orderメソッドで降順、昇順が選べるよ
  # ASCが昇順「1、2、3、・・」、DESCが降順「10、9、8・・・」
  def sort_for(nutrition,updown)
    if nutrition == "熱量"
      if updown == "高い順"
        Food.order(calorie: :DESC)
      else
        Food.order(calorie: :ASC)
      end
    else
      if updown == "高い順"
        Food.order(protein: :DESC)
      else
        Food.order(protein: :ASC)
      end
    end
  end
end
