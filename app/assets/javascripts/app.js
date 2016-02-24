$(document).on("page:load", renderPage);
$(document).ready(renderPage);

function renderPage() {
	if ($("#donor-profile").length !== 0) {
		$("#odometer").text("0");
		var donationCount = $("[data-donation-count").data("donation-count");
		console.log(donationCount);
		setTimeout(function(){
	    odometer.innerHTML = donationCount;
		}, 1000);
	}
}