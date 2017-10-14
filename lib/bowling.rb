class Bowling
    def initialize
        # 全体の点数の合計値
        @total_score = 0
        # 全体の（フレームの）スコアを格納する配列
        @scores = []
        # 一時保管用の配列（現在のフレーム）
        @temp = []
    end
    
    def add_score(pins)
        @temp << pins
        if @temp.size == 2
            if is_spare?(@temp) and last_frame?(@scores.size+1)
                # spare かつ 最終フレームの場合
            else
                # そうじゃない場合
                @scores << @temp
                @temp = []
            end
        elsif @temp.size == 3
            @scores << @temp
            @temp = []
        elsif pins == 10 and @temp.size == 1 # strike
            @scores << @temp
            @temp = []
        end
        # @total_score += pins
    end
    
    # スコアの合計値を返却する
    def total_score
        @total_score
    end
    
    # 各（フレームの）スコアを合計する
    def calc_score
        @scores.each.with_index(1) do |score, index|
            @total_score += score.inject(:+)
            if last_frame?(index)
                # no bonus
            elsif is_strike?(score)
                @total_score += calc_strike_bounus(index)
            elsif is_spare?(score)
               @total_score += calc_spare_bounus(index)
            end
        end
    end
    
    private
    def is_spare?(score)
        score.inject(:+) == 10
    end
    
    def is_strike?(score)
        score.first == 10
    end
    
    # 最終フレームかどうかをチェックする
    def not_last_frame?(index)
        index < 10
    end
    
    def last_frame?(index)
        ! not_last_frame?(index)
    end
    
    def calc_spare_bounus(index)
       if @scores[index]
           @scores[index].first || 0
       else
           @temp.first || 0
       end
    end
    
    def calc_strike_bounus(index)
        score = @scores[index] || @temp || [0]
        if is_strike?(score)
            next_score = @scores[index+1] || @temp || [0]
            10 + next_score.first
        else
            score.sum
        end
    end
end
