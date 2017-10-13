class Bowling
    def initialize
        @total_score = 0
    end
    
    def add_score(pins)
       @total_score += pins
    end
    
    # スコアの合計値を返却する
    def total_score
        @total_score
    end
end
