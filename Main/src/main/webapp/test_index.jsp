<!DOCTYPE html>
<html lang="ko"><head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
		<meta http-equiv="Content-Script-Type" content="text/javascript">
		<meta http-equiv="Content-Style-Type" content="text/css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-store">
		<meta http-equiv="Expires" content="-1">
        <title></title>
		<link rel="stylesheet" href="/Main/static/css/style.css?v=202106">
		<link rel="stylesheet" href="/Main/static/css/style.css">
		<link rel="stylesheet" href="/res/css/swiper.css?v=20201123">
		<script src="https://stdux.inicis.com/mobile/resources/js/jquery/jquery-3.5.1.min.js"></script>
		<!--번역서비스 라이브러리 추가 -->
		<script src="https://resource.inicis.com/js/translate/translateLib.js" type="text/javascript"></script>
		<script src="/res/js/tborder.js?v=202105"></script>
		<script src="/res/js/swiper.js"></script>

		<script type="text/javascript">


			$(document).ready(function() {
				$("#disp_tot_items_qty").text(getTOTqty());
				$("#disp_tot_items_amt").text(comma(getTOTamt()));

		        $(".tab").click(function () {
		            swiper.slideTo($(this).data("tab_no"));
				});

				if(eval("false")){
					$(".footer").hide();
				}


				var myPlugin = {
					name: 'debugger',
					params: {
						debugger: false,
					},
					on: {
						init: function () {
							if (!this.params.debugger) return;
							//console.log('init');
						},
						slideChange: function () {
							if (!this.params.debugger) return;
							console.log('slideChange', this.previousIndex, '->', this.activeIndex);

				            $(".tab").removeClass("active");
				            $(".tab-"+this.activeIndex).addClass("active");
				            $(".tab-"+this.activeIndex).focus();
						},
					},
				};

				// Install Plugin To Swiper
			    Swiper.use(myPlugin);

				var swiper = new Swiper('.swiper-container', {
					autoHeight: true,
					spaceBetween: 30,
					debugger: true,
			    });
			});
		</script>
</head>
<body>
	<div class="wrap">

		<div class="header">
			<div class="inner">
				<div class="nav_tit"><span inicistranslate="true" inicistranslateindex="0">홍콩반점0410 부평로데오점</span></div>
				<ul class="nav">
					


						
							
								<li><a href="#" class="tab tab-0 active" data-tab_no="0" inicistranslate="true" inicistranslateindex="13">면류<span></span></a></li>
							
							
						
					


						
							
							
								<li><a href="#" class="tab tab-1" data-tab_no="1" inicistranslate="true" inicistranslateindex="14">밥류<span></span></a></li>
							
						
					


						
							
							
								<li><a href="#" class="tab tab-2" data-tab_no="2" inicistranslate="true" inicistranslateindex="15">요리류<span></span></a></li>
							
						
					


						
							
							
								<li><a href="#" class="tab tab-3" data-tab_no="3" inicistranslate="true" inicistranslateindex="16">음료&amp;주류<span></span></a></li>
							
						
					


						
							
							
								<li><a href="#" class="tab tab-4" data-tab_no="4" inicistranslate="true" inicistranslateindex="17">사이드<span></span></a></li>
							
						
					
				</ul>
			</div>
		</div>



		<div class="contents swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-autoheight">
			<div class="swiper-wrapper" style="height: 1391px; transform: translate3d(0px, 0px, 0px);">
				
					<div class="inner swiper-slide swiper-slide-active" style="width: 700px; margin-right: 30px;">
					
						
						
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010007', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121145_010007.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="21">짜장면</h3>
										</div>
										<div class="item_price">
											<span class="price"> 6,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010008', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121200_010008.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="22">짜장면 곱빼기</h3>
										</div>
										<div class="item_price">
											<span class="price"> 7,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010001', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123120950_010001.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="23">짬뽕</h3>
										</div>
										<div class="item_price">
											<span class="price"> 7,800
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010002', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121004_010002.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="24">짬뽕 곱빼기</h3>
										</div>
										<div class="item_price">
											<span class="price"> 8,800
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010012', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121302_010012.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="25">쟁반짜장(2인분)</h3>
										</div>
										<div class="item_price">
											<span class="price"> 16,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('000012', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123185752_000012.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="26">볶음짬뽕</h3>
										</div>
										<div class="item_price">
											<span class="price"> 9,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('000001', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123120511_000001.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="27">고기짜장</h3>
										</div>
										<div class="item_price">
											<span class="price"> 8,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('000004', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123120552_000004.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="28">고기짜장 곱빼기</h3>
										</div>
										<div class="item_price">
											<span class="price"> 9,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('000002', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123120530_000002.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="29">고기짬뽕</h3>
										</div>
										<div class="item_price">
											<span class="price"> 9,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('000005', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123120604_000005.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="30">고기짬뽕 곱빼기</h3>
										</div>
										<div class="item_price">
											<span class="price"> 10,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010010', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121237_010010.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="31">고추짜장</h3>
										</div>
										<div class="item_price">
											<span class="price"> 8,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010011', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121249_010011.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="32">고추짜장 곱빼기</h3>
										</div>
										<div class="item_price">
											<span class="price"> 9,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010004', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121108_010004.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="33">고추짬뽕</h3>
										</div>
										<div class="item_price">
											<span class="price"> 8,900
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010005', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121120_010005.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="34">고추짬뽕 곱빼기</h3>
										</div>
										<div class="item_price">
											<span class="price"> 9,900
											</span>
										</div>
									</a>
								</div>
							
						
					
					</div>
				
					<div class="inner swiper-slide swiper-slide-next" style="width: 700px; margin-right: 30px;">
					
						
						
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010009', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121225_010009.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="35">짜장밥</h3>
										</div>
										<div class="item_price">
											<span class="price"> 8,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010003', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123174938_010003.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="36">짬뽕밥</h3>
										</div>
										<div class="item_price">
											<span class="price"> 7,800
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('000003', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123120543_000003.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="37">고기짬뽕밥</h3>
										</div>
										<div class="item_price">
											<span class="price"> 9,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('010006', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121132_010006.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="38">고추짬뽕밥</h3>
										</div>
										<div class="item_price">
											<span class="price"> 8,900
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('030001', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240229181514_030001.jpg">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="39">공기밥</h3>
										</div>
										<div class="item_price">
											<span class="price"> 1,000
											</span>
										</div>
									</a>
								</div>
							
						
					
					</div>
				
					<div class="inner swiper-slide" style="width: 700px; margin-right: 30px;">
					
						
						
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040001', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240125105806_040001.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="40">탕수육(소) 2인</h3>
										</div>
										<div class="item_price">
											<span class="price"> 16,800
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040002', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240125105834_040002.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="41">탕수육(중) 3인</h3>
										</div>
										<div class="item_price">
											<span class="price"> 18,800
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040003', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240125105851_040003.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="42">탕수육(대) 4인</h3>
										</div>
										<div class="item_price">
											<span class="price"> 22,800
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('035', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121453_035.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="43">깐풍새우</h3>
										</div>
										<div class="item_price">
											<span class="price"> 19,900
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040007', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121604_040007.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="44">군만두 한접시</h3>
										</div>
										<div class="item_price">
											<span class="price"> 6,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040008', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121614_040008.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="45">군만두 반접시</h3>
										</div>
										<div class="item_price">
											<span class="price"> 3,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040011', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/230328142859_040011.jpg">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="46">꽃빵(5개)</h3>
										</div>
										<div class="item_price">
											<span class="price"> 4,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040010', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123173531_040010.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="47">꽃빵(홀3개)</h3>
										</div>
										<div class="item_price">
											<span class="price"> 3,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040013', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121731_040013.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="48">멘보샤(중국식 새우토스트)</h3>
										</div>
										<div class="item_price">
											<span class="price"> 9,900
											</span>
										</div>
									</a>
								</div>
							
						
					
					</div>
				
					<div class="inner swiper-slide" style="width: 700px; margin-right: 30px;">
					
						
						
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('050001', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123174843_050001.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="49">콜라</h3>
										</div>
										<div class="item_price">
											<span class="price"> 2,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('050002', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123122128_050002.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="50">사이다</h3>
										</div>
										<div class="item_price">
											<span class="price"> 2,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('050011', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/220829153433_050011.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="51">초록매실</h3>
										</div>
										<div class="item_price">
											<span class="price"> 700
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('050003', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/230712174611_050003.jpg">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="52">소주</h3>
										</div>
										<div class="item_price">
											<span class="price"> 5,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('050006', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/230712174633_050006.jpg">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="53">맥주</h3>
										</div>
										<div class="item_price">
											<span class="price"> 5,000
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('050005', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123122221_050005.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="54">칭따오 (640ml)</h3>
										</div>
										<div class="item_price">
											<span class="price"> 7,500
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('050004', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123122206_050004.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="55">만만춘(250ml)</h3>
										</div>
										<div class="item_price">
											<span class="price"> 15,000
											</span>
										</div>
									</a>
								</div>
							
						
					
					</div>
				
					<div class="inner swiper-slide" style="width: 700px; margin-right: 30px;">
					
						
						
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040012', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121710_040012.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="56">계란후라이</h3>
										</div>
										<div class="item_price">
											<span class="price"> 900
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040017', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121847_040017.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="57">마라소스</h3>
										</div>
										<div class="item_price">
											<span class="price"> 800
											</span>
										</div>
									</a>
								</div>
							
								<div class="item_list">
									<a href="Javascript:show_item_detail('040016', 'N');">
										<div class="item_img">
											<img src="https://to-img.inicis.com/torder/resources/img/5002/5002002/Menu/240123121809_040016.png">
										</div>
										<div class="item_tit">
											<div class="badge">
												
												
										    </div>
											<h3 inicistranslate="true" inicistranslateindex="58">트러플오일</h3>
										</div>
										<div class="item_price">
											<span class="price"> 600
											</span>
										</div>
									</a>
								</div>
							
						
					
					</div>
				
				<div class="clear"></div>
			</div>
		<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>



		<div class="footer">
			
				
					<div class="inner">
						<div class="f_order_section">
							<div class="f_order f_order_info">
								
<script type="text/javascript">
	$(document).ready(function() {
		if(DFN_BRDG_ID != "" && DFN_BRDG_ID == "ON002"){
			$("#span_amt").html("포인트");
			$("#span_won").html("점");
		}
	});
</script>

	<ul>
		<li>
			<span inicistranslate="true" inicistranslateindex="1">수량</span>
			<span id="disp_tot_items_qty" class="o_price">NaN</span>
			<span inicistranslate="true" inicistranslateindex="2">개</span>
		</li>
		<li>
			<span id="span_amt" inicistranslate="true" inicistranslateindex="3">금액</span>
			<span id="disp_tot_items_amt" class="o_price"></span>
			<span id="span_won" inicistranslate="true" inicistranslateindex="4">원</span>
		</li>
	</ul>
							</div>

							<div class="f_order f_order_btn">
								<a href="javascript:goLocation('cart_list');" class="color" inicistranslate="true" inicistranslateindex="18">주문하기</a>
							</div>
						</div>

					</div>


					<div class="f_nav_section">
							<div class="inner">
								
<script type="text/javascript">
	$(document).ready(function() {
		if(DFN_BRDG_ID != ""){
			if(DFN_BRDG_ID == "ON002"){
				$(".store_btn").hide();
				$(".order_list_btn").show();
				$(".empty_btn").show();
			} else{
				$(".brdg_btn").show();
				$(".brdg_anch").prop("href","/store_list?brg_id="+DFN_BRDG_ID);
			}
		}

		if(DFN_BRAND_CD == "5002005"){
			$(".guide_btn").hide();
			$(".nutrition_btn").show();
		}
	});
</script>

	
	
		<div class="f_nav">
			<div class="f_nav_btn empty_btn" style="display: none;">
			</div>

			<div class="f_nav_btn">
				<a href="javascript:goLocation('item_list', '01');"><img src="/res/img/f_btn_01.png"><span inicistranslate="true" inicistranslateindex="5">홈</span> </a>
			</div>
			<div class="f_nav_btn brdg_btn" style="">
				<a href="/store_list?brg_id=null" class="brdg_anch">
					<img src="/res/img/f_btn_store_nor.png"><span inicistranslate="true" inicistranslateindex="6">상점선택</span>
				</a>
			</div>

			<div class="f_nav_btn guide_btn">
				<a href="javascript:goLocation('info');"> <img src="/res/img/f_btn_02.png"><span inicistranslate="true" inicistranslateindex="7">사용안내</span>
				</a>
			</div>
			<div class="f_nav_btn" style="display: none">
				<a href=""> <img src="/res/img/f_btn_03.png"><span>Language</span>
				</a>
			</div>
			<div class="f_nav_btn">
				<a href="javascript:goLocation('cart_list');"> <img src="/res/img/f_btn_04.png"><span inicistranslate="true" inicistranslateindex="8">장바구니</span>
				</a>
			</div>
			<div class="f_nav_btn store_btn">
				<a href="javascript:goLocation('merchant_info');">
					<img src="/res/img/f_btn_05.png"><span inicistranslate="true" inicistranslateindex="9">가맹점정보</span>
				</a>
			</div>
			<div class="f_nav_btn nutrition_btn" style="display: none">
				<a href="javascript:goLocation('nutritious_info');">
					<img src="/res/img/f_btn_nutrition.png"><span inicistranslate="true" inicistranslateindex="10">영양정보</span>
				</a>
			</div>
			<div class="f_nav_btn order_list_btn" style="display: none">
				<a href="javascript:goLocation('order_list');">
					<img src="/res/img/f_btn_ordList.png"><span inicistranslate="true" inicistranslateindex="11">주문내역</span>
				</a>
			</div>

			<div class="f_nav_btn empty_btn" style="display: none;">
			</div>
		</div>
	


							</div>
					</div>
				
				
			

		</div>


		<div id="item_detail" class="pop_bg" style="display: none;">
			<div class="pop_wrap">
				<div class="pop">
					<div class="pop_con">

						<div class="item_info">
							<div class="item_img">
								<img id="item_img_src" src="">
							</div>
							<div class="item_tit">
								<h3 id="item_nm"></h3>
							</div>
							<span id="item_sub_names"></span>
						</div>


						<div class="order_info">
							<div class="item_quantity">
								<button id="decrease" class="decrease" onclick="set_qty('-');">구매수량 감소</button>
								<button id="increase" class="increase" onclick="set_qty('+');">구매수량 증가</button>
								<span id="item_qty" class="count">1</span>
							</div>
							<div class="item_price">
								<span id="disp_item_um" class="price"></span> <span inicistranslate="true" inicistranslateindex="12">원</span>
							</div>
						</div>

						<div id="select_item_opt_main"></div>

					</div>
					<div class="pop_btn">
						<div class="opacity_up"></div>
						<ul>
							<li><a href="JavaScript:hide_item_detail();" class="pop_close" inicistranslate="true" inicistranslateindex="19">취소하기</a></li>
							<li><a href="JavaScript:add_cart();" class="pop_close color" inicistranslate="true" inicistranslateindex="20">추가하기</a></li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>

			</div>
		</div>
	</div>




</body></html>