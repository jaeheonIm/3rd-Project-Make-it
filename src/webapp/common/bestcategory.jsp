<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<script type="text/javascript">
//전체 클릭시
	function now() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestnow.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=now]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
	function food() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestfood.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=food]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
	function fashion() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestfashion.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=fashion]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
	function tech() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestTect.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=tech]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
	function beauty() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestbeauty.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=beauty]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
	function baby() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestbaby.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=baby]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
	function trip() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestTrip.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=trip]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
	function pet() {
		$(".img").attr('style','none');
		let arr = '${bool}';
		$.ajax("bestpet.do", {
			type: "get",
			dataType : "json",
			success : function(data){
				$("img[name=pet]").attr('style','border-color: #3fe8d9');
				let add = "";
				$.each(data, function(index, obj){
					add += "<div class='col-9 col-sm-6 col-md-4 col-lg-4'>";
					add += '<div class="single-product-area mb-30">';
					add += '<div class="product_image">';
					add += '<img class="normal_img" src="imgs/'+this.storeImg +'"alt="" style="height: 220px;">';
					if(arr.indexOf(this.storeIdx) != -1){
	                    add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>';
	                    add += '</div>';
	               	} else if(arr.indexOf(this.storeIdx) == -1){
	               		add += '<div class="product_wishlist">';
	                    add += '<a href="javascript:storeLikeUpdate('+ this.storeIdx +')"><i id="heart" class="fa-solid fa-heart-circle-plus"></i></a>';
	                    add += '</div>';
	               	}
					add += '</div>';
					add += '<div class="product_description">';
					add += '<a id="title" href="detail.do?memberId=${memberId}&storeIdx=' + this.storeIdx+'">' + this.storeTitle +'</a>';
					add += '<h6 class="product-price">' + this.storePrice +'</h6>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
					add += '</div>';
				});
				$("#best").html(add);
			},
			error : function(){
				alert('실패...');
			}
		});
	}
	
</script>
