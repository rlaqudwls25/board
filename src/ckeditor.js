<textarea rows="15" name="content" id="content"/>

ClassicEditor
    .create( document.querySelector('#content'))
    .then( editor => {
        console.log( editor );
    } )
    .catch( error => {
        console.error( error );
    } );


