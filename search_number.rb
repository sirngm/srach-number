# -*- coding: utf-8 -*-

class SearchNumber

  First = 1
  Last = 1000
  Num = Last - First + 1

  @param       #標準入力の値
  @removed_num #配列から取り除く値
  @arr = []    #値を取り除かれた後の配列

  attr_accessor :param

  # 配列から取り除かれた値を調べ、標準出力に出力する。
  # @return [nil]
  def search
    if set_removed_num === false
      return
    end
    set_arr

    org_arr_sum = (First + Last) * Num / 2
    arr_sum = @arr.inject(:+)
    answer = org_arr_sum - arr_sum

    print "入力値：#{@removed_num}\n解答：#{answer}\n"
  end

  private

  # @removed_numをセットする
  # @return [Integer] @removed_numを返す
  # @return [Boolean] 引数が1から1000ではない場合、falseを返す
  def set_removed_num
    unless @param.match(/^\d+$/) && @param.to_i >= First && @param.to_i <= Last
      print "#{First}から#{Last}までの数値を入力してください。\n"
      return false
    end
    @removed_num = @param.to_i
  end

  # @arrをセットする
  # @return [Array] @arrを返す
  def set_arr
    arr = Array(First..Last)
    removed_index = @removed_num - 1
    arr.delete_at(removed_index)
    @arr = arr.sample(Num)
  end

end
