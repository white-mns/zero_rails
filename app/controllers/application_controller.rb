class ApplicationController < ActionController::Base
    def placeholder_set
        @placeholder = {}
        @placeholder["Number"]      = "例）1~10/50~100"
        @placeholder["Text"]        = "例）罠/\"護衛\""
        @placeholder["Name"]        = "例）バルーナス/\"ナス\""
        @placeholder["Item"]        = "例）あなたのユニット"
        @placeholder["ItemKind"]    = "例）火炎罠/カルマ電撃護衛/"
        @placeholder["OrigName"]    = "例）ファイター/サキュバス/"
        @placeholder["Fuka"]        = "例）活力/\"鎮痛\""
        @placeholder["AddEffect"]   = "例）加速付与/\"遅延\""
    end
end
