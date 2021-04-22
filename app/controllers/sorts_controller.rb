class SortsController < ApplicationController
  
  # ソート機能やり方は検索機能と同じ、orderメソッドで降順、昇順が選べるよ
  # ASCが昇順「1、2、3、・・」、DESCが降順「10、9、8・・・」
  def sort
    @nutrition = params["nutrition"]
    @updown = params["updown"]
    @conclude = sort_for(@nutrition,@updown).page(params[:page]).per(12)
    @categories = Category.all
    @tip = Tip.find(Tip.pluck(:id).sample)
    # @foods = params["foods"]
  end
  
  private
  
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
