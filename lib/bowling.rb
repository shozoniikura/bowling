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
       @total_score += pins
    end
    
    # スコアの合計値を返却する
    def total_score
        @total_score
    end
    
    # 各（フレームの）スコアを合計する
    def calc_score
    end
end
