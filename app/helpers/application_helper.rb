module ApplicationHelper
    def page_title
        title = "ゼロ城データ小屋"
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
        text = sprintf("%d", result_no) + "回" + generate_text
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
        link_to "結果", "http://blacktea.sakura.ne.jp/teaconvini/RESULT/c"+file_name+".html", :target => "_blank"
    end
    
    def character_old_link(latest_result_no, e_no, result_no, generate_no)
        if e_no <= 0 then return end
        if result_no == latest_result_no then return end

        result_no_text = sprintf("%03d", result_no)
        generate_text  = generate_no > 0 ? "_" + sprintf("%d", generate_no) : ""
        file_name = sprintf("%04d", e_no)
        link_to "第"+ sprintf("%d", result_no) + "回", "http://blacktea.sakura.ne.jp/teaconvini/"+result_no_text+generate_text+"/RESULT/c"+file_name+".html", :target => "_blank"
    end
    
    def act_link(latest_result_no, result_no, generate_no, block_no, act, e_no)
        if e_no <= 0 then return end
        if result_no != latest_result_no then return end

        file_name = sprintf("%d", block_no - 1)
        act_no = sprintf("%d", act - 1)
        id = "act" + act_no + "-eno" + sprintf("%d", e_no)
        link_to "侵略", "http://blacktea.sakura.ne.jp/teaconvini/RESULT/battle"+file_name+".html#"+id, :target => "_blank"
    end
    
    def act_old_link(latest_result_no, result_no, generate_no, block_no, act, e_no)
        if e_no <= 0 then return end
        if result_no == latest_result_no then return end

        result_no_text = sprintf("%03d", result_no)
        generate_text  = generate_no > 0 ? "_" + sprintf("%d", generate_no) : ""
        file_name = sprintf("%d", block_no - 1)
        act_no = (act == 1) ? "" : sprintf("%d", act - 1)
        id = "act" + act_no + "-eno" + sprintf("%d", e_no)
        link_to "第"+ sprintf("%d", result_no) + "回", "http://blacktea.sakura.ne.jp/teaconvini/"+result_no_text+generate_text+"/RESULT/battle"+file_name+".html#"+id, :target => "_blank"
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

    def td_form(f, form_params, placeholders, class_name: nil, colspan: nil, label: nil, params_name: nil, placeholder: nil, checkboxes: nil)
        haml_tag :td do
            haml_concat f.label params_name.to_sym, label
        end

        # テキストフォームの描画
        if !class_name.nil?  then
            td_text_form(f, form_params, placeholders, class_name: class_name, colspan: colspan, params_name: params_name, placeholder: placeholder)
        end

        # チェックボックス選択フォームの描画
        if !checkboxes.nil?  then
            td_text_checkbox(f, form_params, placeholders, class_name: class_name, colspan: colspan, checkboxes: checkboxes)
        end
    end

    def td_text_form(f, form_params, placeholders, class_name: nil, colspan: nil, label: nil, params_name: nil, placeholder: nil)
        haml_tag :td, class: class_name, colspan: colspan do
            haml_concat text_field_tag params_name.to_sym, form_params[params_name], placeholder: placeholders[placeholder]
        end
    end

    def td_text_checkbox(f, form_params, placeholders, class_name: nil, colspan: nil, checkboxes: [])
        haml_tag :td, class: class_name, colspan: colspan do
            checkboxes.each do |hash|
                # チェックボックスの描画
                if !hash[:params_name].nil? then
                    haml_tag :span, class: hash[:class_name] do
                        haml_concat check_box_tag hash[:params_name].to_sym, form_params[hash[:params_name]], form_params[hash[:params_name]]
                        haml_concat label_tag hash[:params_name].to_sym, hash[:label]
                    end
                end

                # 改行指定
                if hash[:br] then
                    haml_tag :br do end
                end
            end
        end
    end

    def tbody_toggle(form_params, params_name: nil, label: {open: "", close: ""}, act_desc: nil, base_first: false)
        haml_tag :tbody, class: "tbody_toggle pointer"do
            haml_tag :tr do
                haml_tag :td, colspan: 5 do
                    if base_first then
                        haml_concat hidden_field_tag :base_first, form_params["base_first"]
                    end

                    haml_concat hidden_field_tag params_name.to_sym, form_params[params_name]

                    act_icon(false)

                    haml_concat label_tag params_name.to_sym, "　" + label[:open],  class: "act_desc"
                    haml_concat label_tag params_name.to_sym, "　" + label[:close], class: "act_desc closed"
                    if act_desc then
                        haml_tag :div, class: "act_desc" do
                           haml_concat "　" + act_desc
                        end
                    end
                end
            end
        end
    end

    def all_assembly_text(assembly)
        if !assembly then
            return
        end

        assembly_text = ""
        assembly.each do |parts|
          assembly_text += parts.orig.name + "、" if parts.orig
        end
        assembly_text.chop()
    end

    def all_condition_text(conditions)
        if !conditions then
            return
        end

        condition_text = ""
        conditions.each do |condition|
          condition_text += condition.condition.name + "、" if condition.condition
        end
        condition_text.chop()
        condition_text.delete("　")
    end
end
