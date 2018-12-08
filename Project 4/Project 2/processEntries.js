var processEntries = function(){
    var miles = parseFloat($("miles").value);
    var gallons = parseFloat($("gallons").value);
    var price = parseFloat($("price").value);
    if (isNaN(miles) || isNaN(gallons)){
        alert("Both entries must be numeric");
    }else if (miles <=0 || gallons <= 0){
        alert("Both entries must be greater than zero");
    }else if (isNaN(price)){
        alert("Please enter a valid price")
    }else{
        var cost = calculateCost(miles, gallons, price);
        var successMessage = "Your fuel cost is $" + parseInt(cost, 10);
        $("cost").innerHTML = successMessage;
    }
 };
