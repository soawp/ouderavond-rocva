const simulatedButton = (arg) => {
	arg = arg.toUpperCase();
	alert(`Sorry, maar de ${arg} knop doet op het moment niks omdat het alleen bedoeld is als lesmateriaal.`);
}
const scrollToTop = () => {
	window.scroll({
		top: 0,
		behavior: 'smooth'
	});
}