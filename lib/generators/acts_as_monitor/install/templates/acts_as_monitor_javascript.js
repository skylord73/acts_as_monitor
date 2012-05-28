document.observe('dom:loaded', function()
{
  create_status_window();

  function create_status_window() {
    new Insertion.Bottom(
      document.body, 
      "<div id='acts_as_monitor_status_window'></div>"
    );
    var status_window = $('acts_as_monitor_status_window');
    Position.absolutize(status_window);
    status_window.observe('click', function(ev) {status_window.fade(); });
    status_window.hide();
  }

  var handle_monitor = function(ev)
  {
    var id = ev.target.getAttribute('data-id');
    new Ajax.Request('/acts_as_monitor/monitors/'+ id +'.js', 
    {
      method: 'get',
      evalJSON: 'force',
      parameters: {
        class_name: ev.target.getAttribute('data-class')
        //id:         ev.target.getAttribute('data-id')
      },
      onSuccess: function(response)
      {
        var rsp = response.responseJSON;
        create_popup(rsp.text,ev.target);
      },
      onFailure: function(response) 
      {
        alert('Failure ' + response.status);
      }
    });
  }

  //Create popup with information
  function create_popup(text,target)
  {
    //alert(text);
    var status_window = $('acts_as_monitor_status_window');
    status_window.update(text);
    Position.clone(target,status_window);
    new Effect.Appear(status_window);
    //alert("Fatto");
  }

  //$$('.acts_as_monitor_icon_red .acts_as_monitor_icon_yellow .acts_as_monitor_icon_green') 
  var pulsate_forever = function(elem) {
    new Effect.Pulsate(elem, {
      //afterFinish: function(o) { new Effect.Pulsate(o.element, o.options); }
    });
  }
  $$('.acts_as_monitor_icon_red').each(function(elmt)
    {
    elmt.observe('click', handle_monitor);
    pulsate_forever(elmt);
    }); 
  
  $$('.acts_as_monitor_icon_yellow').each(function(elmt)
    {
    elmt.observe('click', handle_monitor);
    }); 
});
