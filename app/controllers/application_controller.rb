class ApplicationController < ActionController::Base
    def placeholder_set
        @placeholder = {}
        @placeholder["Number"] = "例）1~10/50~100"
        @placeholder["Text"]   = "例）カルマ火炎罠/\"火炎罠\""
        @placeholder["Name"]   = "例）太郎/\"次郎\""
    end
end
