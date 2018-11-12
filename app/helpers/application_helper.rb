module ApplicationHelper
    def page_title
        title = "ゼロ城試遊会データ小屋"
        title = @page_title + " | " + title if @page_title
        title
    end

    def top_result_no(result_no,generate_no)
        if !result_no then return "-" end
        text = ""
        generate_text = ""
        generate_text = "再" if generate_no > 0
        num = 2
        while num <= generate_no do
            num += 1
            generate_text += "々"
        end
        text = result_no + "回" + generate_text
        text
    end

    def pc_name_text(e_no, pc_name)
        e_no_text = "(" + sprintf("%d",e_no) + ")"
        if pc_name then
            pc_name.name.html_safe + e_no_text
        else
            e_no_text
        end
    end

    def character_link(e_no)
        if e_no <= 0 then return end

        file_name = sprintf("%04d",e_no)
        link_to " 結果", "http://blacktea.sakura.ne.jp/teaconvini/RESULT/c"+file_name+".html", :target => "_blank"
    end
    
    def character_old_link(last_result_no, e_no, result_no, generate_no)
        if e_no <= 0 then return end
        if result_no == last_result_no then return end

        result_no_text = sprintf("%03d", result_no)
        generate_text  = generate_no > 0 ? "_" + sprintf("%d", generate_no) : ""
        file_name = sprintf("%04d", e_no)
        link_to " 過去結果", "http://mistofwar.kitunebi.com/M_o_W_5/"+result_no_text+generate_text+"/RESULT/c"+file_name+".html", :target => "_blank"
    end
    
    def act_link(last_result_no, result_no, generate_no, block_no, act, e_no)
        if e_no <= 0 then return end
        if result_no != last_result_no then return end

        file_name = sprintf("%d", block_no - 1)
        act_no = (act == 1) ? "" : sprintf("%d", act - 1)
        id = "act" + act_no + "-eno" + sprintf("%d", e_no)
        link_to " 戦闘機動", "http://blacktea.sakura.ne.jp/teaconvini/RESULT/battle"+file_name+".html#"+id, :target => "_blank"
    end
    
    def act_old_link(last_result_no, result_no, generate_no, block_no, act, e_no)
        if e_no <= 0 then return end
        if result_no == last_result_no then return end

        result_no_text = sprintf("%03d", result_no)
        generate_text  = generate_no > 0 ? "_" + sprintf("%d", generate_no) : ""
        file_name = sprintf("%d", block_no - 1)
        act_no = (act == 1) ? "" : sprintf("%d", act - 1)
        id = "act" + act_no + "-eno" + sprintf("%d", e_no)
        link_to " 過去結果", "http://mistofwar.kitunebi.com/M_o_W_5/"+result_no_text+generate_text+"/RESULT/battle"+file_name+".html#"+id, :target => "_blank"
    end

    def search_submit_button()
        haml_tag :button, class: "btn submit", type: "submit" do
            haml_concat fa_icon "search", text: "検索する"
        end
    end

    def help_icon()
        haml_concat fa_icon "question-circle"
    end

    def act_desc(is_opened)
        desc        = is_opened ? "（クリックで閉じます）" : "（クリックで開きます）"
        desc_closed = is_opened ? "（クリックで開きます）" : "（クリックで閉じます）"

        haml_tag :span, class: "act_desc" do
            haml_concat desc
        end

        haml_tag :span, class: "act_desc closed" do
            haml_concat desc_closed
        end
    end

    def act_icon(is_opened)
        icon        = is_opened ? "times" : "plus"
        icon_closed = is_opened ? "plus"  : "times"

        haml_tag :span, class: "act_desc" do
            haml_concat fa_icon icon, class: "fa-lg"
        end

        haml_tag :span, class: "act_desc closed" do
            haml_concat fa_icon icon_closed, class: "fa-lg"
        end
    end

    def all_assembly_text(assembly)
        if !assembly then
            return
        end

        assembly_text = ""

        assembly.each do |parts|
          assembly_text += parts.orig_name_name.name + "、" if parts.orig_name_name
        end

        assembly_text.chop()
    end

    def elemental_border(name)
        if !name then 
            return
        end

        border_style = ""
        if name.name == "物理" then border_style = "0.2rem #ccc solid"
        elsif name.name == "霊障" then border_style = "0.2rem #c4c solid"
        elsif name.name == "粒子" then border_style = "0.2rem #4cc solid"
        elsif name.name == "火炎" then border_style = "0.2rem #c44 solid"
        elsif name.name == "電子" then border_style = "0.2rem #ee8 solid"
        end

        "border-left: " + border_style;
    end
end
