App.web_notifications = App.cable.subscriptions.create "WebNotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#cashier_acknowledgment').append(this.acknowledgment())

  acknowledgment: () ->
    "<div id='new_rates_acknowledgment' class='modal show fade in acknowledgments' tabindex='-1' role='dialog' data-keyboard='false' data-backdrop='static'>
      <div class='modal-dialog' role='document'>
        <div class='modal-content'>
          <div class='modal-header'>
            <h5 class='modal-title'>Увага! Курс валют було змінено!</h5>
          </div>
          <div class='modal-body'>
            <p>Натисніть на кнопку 'Зрозуміло' та подивіться на оновлену інформацію</p>
          </div>
          <div class='modal-footer'>
            <form class='edit_user' id='edit_user' action='/users/submit_acknowledgment' accept-charset='UTF-8' method='post'>
              <input name='utf8' type='hidden' value='✓'>
              <input type='hidden' name='_method' value='patch'>
              <input value='new_rates' type='hidden' name='user[acknowledgment_type]' id='user_acknowledgment_type'>
              <input type='submit' name='commit' value='Зрозуміло' class='btn btn-primary' data-disable-with='Зрозуміло'>
            </form>
          </div>
        </div>
      </div>
    </div>"