        Given la pagina de tuBanco Personas
        And un usuario <user> y password <password> validos
        And la cuenta origen <origen> tiene fondos
        When El usuario hace log in en la pagina de tuBanco Personas
        And el usuario selecciona pagos y transferencias
        And el usuario selecciona cuenta origen <origen>
        And el usuario completa los datos del pago único <banco> <ctaDestino> <cedulaDestinario>
        And el usuario coloca monto <monto>
        And el usuario método de pago <method>
        And El usuario confirma la transacción
        Then A la cuenta origen <origen> se le debita monto <monto>
        And A la cuenta origen<origen> se le cobra los impuestos por la transacción
        And el número de cuenta esté enmascardo en la notificación por correo
        Examples:

            | user      | password  | origen     | banco      | ctaDestino | cedulaDestinario | monto | method |
            | Jefferson | Br123456! | 1234567890 | Scotiabank | 1234567899 | 40200680151      | 100   | ACH    |




