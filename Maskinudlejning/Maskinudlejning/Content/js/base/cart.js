var i = 0,
    items = [],
    $items = $('#items'),
    lS = "",
    urlMachine = 'http://dev.maskinudlejning/umbraco/api/Machine/getMachine/',
    urlSort = 'http://dev.maskinudlejning/umbraco/api/Sortiment/getsortiment/';
if (localStorage.getItem('items') != null) {
    lS = JSON.parse(localStorage.getItem('items'));
    if (lS != "") {
        items = lS;
        for (var lSItems = 0; lS.length > lSItems; lSItems++) {
            i = i + lS[lSItems].nItems;
        }
    }
    if (i != 0) {
        $items.text('Vare i kurven: ' + i)
    }
    else {
        $items.text('')

    }
}
$('.add-cart').on('click', function () {
    var $this = $(this),
        val = $this.data('val'),
        type = $this.data('type'),
        exist = false;
    for (var index = 0; items.length > index; index++) {
        if (items[index].Id == val) {
            exist = true;
        }
    }
    for (var index = 0; lS.length > index; index++) {
        if (lS[index].Id == val) {
            exist = true;
        }
    }
    i++;
    $items.text('Vare i kurven: ' + i)
    if (!exist) {

        items.push({ Id: val, nItems: 1, type: type });
    }
    else {
        for (var index = 0; items.length > index; index++) {
            if (items[index].Id == val) {

                items[index].Id = val
                items[index].nItems = items[index].nItems + 1;
                items[index].type = type
            }
        }
    }
    if (items.length > 0) {
        localStorage.setItem('items', JSON.stringify(items))
    }
});
var app = angular.module('myApp', []);
app.controller('myCtrl', ['$scope', '$http', function ($scope, $http) {
    $scope.data = [];
    $scope.dataMachine = [];
    $scope.items = [];
    var lS = JSON.parse(localStorage.getItem('items'));
    var totalD = 0;
    $scope.total = 0;
    $scope.loadTotal = function (data, sItems, type, operator, id) {
        
        if (!type) {
            for (var iI = 0; sItems.length > iI; iI++) {
                if (data.Id == sItems[iI].Id) {
                    totalD += sItems[iI].nItems * data.price;
                }
            }
            $scope.total = totalD;
        }
        else {
            for (var iD = 0; data.length > iD; iD++) {
                for (var iI = 0; sItems.length > iI; iI++) {
                    if (data[iD].Id == sItems[iI].Id && sItems[iI].Id == id) {
                        if (operator) {
                            totalD = $scope.total + data[iD].price;
                        } else {
                            totalD = $scope.total - data[iD].price;
                        }
                    }
                }
            }
            $scope.total = totalD;

        }
      

        
    }
    $scope.removeItem = function (id, data) {
        for (var dItems = 0; data.length > dItems; dItems++) {
            for (var iItems = 0; $scope.items.length > iItems; iItems++) {
                for (var nItems = 0; $scope.items[iItems].nItems > nItems; nItems++) {
                    
                    if ($scope.items[iItems].Id == id) {
                        $scope.loadTotal(data, $scope.items, true, false, id)
                    }
                }
                if ($scope.items[iItems].Id == id) {
                    i = i - $scope.items[iItems].nItems;
                    $scope.items.splice(iItems, 1);
                }
            }
            if (data[dItems].Id == id) {
                data.splice(dItems, 1);
            }
        }
        if (i == 0) {
            localStorage.removeItem('items');
            $items.text('');
        }
        else {

            localStorage.setItem('items', JSON.stringify($scope.items));
            $items.text('Vare i kurven: ' + i);
        }


    }


    $scope.substractItem = function (id, data) {
        for (var index = 0; $scope.items.length > index; index++) {
            if ($scope.items[index].Id == id) {
                $scope.items[index].nItems = $scope.items[index].nItems - 1;
                i = i - 1;

                for (var iItems = 0; $scope.items.length > iItems; iItems++) {
                    if ($scope.items[index] != undefined) {
                        if ($scope.items[index].nItems == 0 && $scope.items[index].Id == data[iItems].Id) {
                            $scope.loadTotal(data, $scope.items, true, false, id)
                            $scope.items.splice(index, 1);
                            data.splice(iItems, 1);
                        }
                    }
                }
            }
        }
        $scope.loadTotal(data, $scope.items, true, false, id)
        $items.text('Vare i kurven: ' + i)
        localStorage.setItem('items', JSON.stringify($scope.items))
    }

    $scope.addItem = function (id, data) {
        for (var index = 0; $scope.items.length > index; index++) {
            if ($scope.items[index].Id == id) {
                $scope.items[index].nItems = $scope.items[index].nItems + 1;
                i = i + 1;
            }
        }
        $scope.loadTotal(data, $scope.items, true, true, id)
        $items.text('Vare i kurven: ' + i)
        localStorage.setItem('items', JSON.stringify($scope.items))

    }


    if (lS != null) {

        for (var index = 0; lS.length > index; index++) {
            $scope.items.push(lS[index]);
            if (lS[index].type == "sortiment") {
                $http.get(urlSort + lS[index].Id).success(function (data) {
                    $scope.data.push(data)
                    $scope.loadTotal(data, $scope.items, false);

                });
            }
            if (lS[index].type == "machine") {
                $http.get(urlMachine + lS[index].Id).success(function (data) {
                    $scope.dataMachine.push(data)
                    $scope.loadTotal(data, $scope.items, false);
                });

            }
        }


    }

    $scope.buyItems = function () {

    }
}]);

$('#myTable').tablesorter();