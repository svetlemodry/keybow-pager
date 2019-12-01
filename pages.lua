require 'keybow-pager/keybow'
require 'keybow-pager/colors'
require 'keybow-pager/buttons'
require 'keybow-pager/operations'

pages = {}
-- Support four pages of commands. 
-- Desktop (for basic desktop/browsing)
pages.DESKTOP = 0
pages.CODING = 1
pages.APPS = 2
pages.UNUSED_3 = 3

pages.colors = {}
pages.colors[pages.DESKTOP] = color.RED;
pages.colors[pages.CODING] = color.GREEN;
pages.colors[pages.APPS] = color.BLUE;
pages.colors[pages.UNUSED_3] = color.YELLOW;

pages.operations = {}
pages.operations[pages.DESKTOP] = {
    operations.browser_close_tab, operations.browser_reopen_tab, operations.scroll_up, operations.text_bigger,
    operations.browser_tab_back, operations.browser_tab_forward, operations.scroll_down, operations.text_smaller
}

pages.operations[pages.CODING] = {
    operations.browser_close_tab, operations.browser_reopen_tab, nil, operations.service_account_template,
    operations.browser_open_copied_link, nil, nil, nil
}

pages.operations[pages.APPS] = {
    operations.open_firefox, operations.open_vivaldi, operations.open_thunderbird, nil,
    nil, nil, nil, nil
}

pages.operations[pages.UNUSED_3] = {
    nil, nil, nil, nil,
    nil, nil, nil, nil
}

pages.operation_colors = {}
pages.operation_colors[pages.DESKTOP] = {
    color.RED, color.DARK_GREEN, color.DARK_YELLOW, color.DARK_GREEN,
    color.GRAY, color.GRAY, color.DARK_YELLOW, color.DARK_GREEN
}
pages.operation_colors[pages.CODING] = {
    color.RED, color.DARK_GREEN, nil, color.RED,        
    color.GRAY, nil, nil, nil
}
pages.operation_colors[pages.APPS] = {
    color.RED, color.YELLOW, color.BLUE, nil,
    nil, nil, nil, nil
}
pages.operation_colors[pages.UNUSED_3] = {
    nil, nil, nil, nil,
    nil, nil, nil, nil
}


pages.button_map = {
    button.ACTION_A0, button.ACTION_A1, button.ACTION_A2, button.ACTION_A3,
    button.ACTION_B0, button.ACTION_B1, button.ACTION_B2, button.ACTION_B3
}


-- the current page. Default at startup is desktop.
pages.page = pages.DESKTOP

function pages.set_page(page_)
    pages.page = page_
    button.set_color(button.TAB_0, color.NONE)
    button.set_color(button.TAB_1, color.NONE)
    button.set_color(button.TAB_2, color.NONE)
    button.set_color(button.TAB_3, color.NONE)
    if (pages.page == pages.DESKTOP) then
        button.set_color(button.TAB_0, pages.colors[pages.DESKTOP])
    elseif (pages.page == pages.CODING) then
        button.set_color(button.TAB_1, pages.colors[pages.CODING])
    elseif (pages.page == pages.APPS) then
        button.set_color(button.TAB_2, pages.colors[pages.APPS])
    elseif (pages.page == pages.UNUSED_3) then
        button.set_color(button.TAB_3, pages.colors[pages.UNUSED_3])
    end
    
    for i = 1, 8, 1
    do
        if (pages.operations[pages.page][i] ~= nil) then
            button.set_color(pages.button_map[i], pages.operation_colors[pages.page][i])
        else
            button.set_color(pages.button_map[i], color.NONE)
        end
    end
end

function pages.get_operation_for_action_button(button_id)
    for i = 1, 8, 1
    do
        if (pages.button_map[i] == button_id) then
            return pages.operations[pages.page][i]
        end
    end
    return nil
end

function pages.run_operation(button_id)
    operation = pages.get_operation_for_action_button(button_id)
    if (operation ~= nil) then
        operation()
    end
end
    
