document.write("hola")
document.writeln(" e")
window.alert("Aquesta pagina es la millor")
window.confirm("Vols continuar?")
let person = prompt("Please enter your name", "Harry Potter");
var numero = parseInt(prompt("Digues un numero"));
var numero1 = prompt("Digues un numero");
var resultado = numero + parseInt(numero1);

if (person != null) {
  document.getElementById("demo").innerHTML =
   person ;
} 

if (numero != null) {
    document.getElementById("suma").innerHTML =
    numero ;
}

if (numero1 != null) {
    document.getElementById("suma1").innerHTML =
    numero1 ;
}

document.getElementById("resultat").innerHTML =
resultado ;
