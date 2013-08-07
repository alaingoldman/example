   var requestBinURL = 'http://requestb.in/15x60eq1';  
   var marketplaceUri = '/v1/marketplaces/TEST-MPg9bCIQUZMBoiPMnvWkQJW'; // this is my marketplace URI
   balanced.init(marketplaceUri);

   function responseCallbackHandler(response) {
      switch (response.status) {
        case 400:
            // missing or invalid field - check response.error for details
            console.log(response.error);
            break;
        case 404:
            // your marketplace URI is incorrect
            console.log(response.error);
            break;
        case 201:
            // console.log(response)
            // console.log("response data uri: " + response.data.uri)
            $.ajax({ url: '#{addbank_bankaccts_path}',
            type: 'POST',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', '#{form_authenticity_token}')},
            dataType: "json",
            data: 'account_uri=' + response.data.uri
            success: function(response) {
              // successfully executed the controller method
              }
            });
            break;
        }
    }

   var tokenizeInstrument = function(e) {
        e.preventDefault();
   
        var $form = $('#bank-account-form');
        var bankAccountData = {
            name: $form.find('.ba-name').val(),
            account_number: $form.find('.ba-an').val(),
            bank_code: $form.find('.ba-rn').val(),
            type: $form.find('select').val()
        };
 
 
        balanced.bankAccount.create(bankAccountData, responseCallbackHandler);
    };
   $('#bank-account-form').submit(tokenizeInstrument);