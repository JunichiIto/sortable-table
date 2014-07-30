$ ->
  $('.table-sortable').sortable
    axis: 'y'
    items: '.item'

    update: (e, ui) ->
      item = ui.item
      $.ajax
        type: 'POST'
        url: item.data().updateUrl
        dataType: 'json'
        data: { fruit: { row_order_position: item.index() }, _method: 'put' }
    start: (e, ui) ->
      maxWidthWhileSorting = 940
      cells = ui.item.children('td')
      widthForEachCell = maxWidthWhileSorting / cells.length + 'px'
      cells.css('width', widthForEachCell)
    stop: (e, ui) ->
      ui.item.children('td').effect('highlight')