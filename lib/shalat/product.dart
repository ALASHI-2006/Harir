


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:harir/shalat/details.dart';



class Product {
  final int id;
  final double price;
  final String title, image, images, subtiltle;
  Color selectedColor;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.images,
    required this.price,
    required this.subtiltle,
    required Color selectedColor,
    this.quantity = 1,
  }) : selectedColor = selectedColor;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      images: json['images'],
      price: json['price'],
      subtiltle: json['subtitle'],
      selectedColor: Color(json['selectedColor']),
      quantity: json['quantity'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'images': images,
      'price': price,
      'subtitle': subtiltle,
      'selectedColor': selectedColor.value,
      'quantity': quantity,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.selectedColor == selectedColor;
  }

  @override
  int get hashCode => id.hashCode ^ selectedColor.hashCode;

  // Add a method to update the selected color
  void updateSelectedColor(Color newColor) { selectedColor = newColor; }

  // Add a getter to access the selected color safely
  Color getSafeSelectedColor() {
    return selectedColor;
  }
   // Update the selected color method to accept context
}

// Example usage:

List<Product> shalatProducts = [
  Product(
    id: 1,
    title: "شيفون",
    images: "images/shifon .jpeg",
    image: "images/shifon .jpeg",
    price: 3.5,
    subtiltle:
        " حرير يُقدّم لكِ شال الشيفون، قطعة استثنائية تُضفي على إطلالتكِ لمسة ساحرة من الأناقة والجمال. ",
    selectedColor: hexToColor('#746478')
    // Set the initial color here
  ),



Product(
id: 2,
title:" جورجيت",
image:"images/bink.jpg",
images:"images/bink.jpg",
price:1.5,
subtiltle: " حرير يقدم لك شال الجورجيت، قطعة استثنائية من الجورجيت الخالص تجسد قمة الفخامة والرقي ", 
  selectedColor: hexToColor('#000000'),

),

 
  
Product(
id: 3,
title:"قطن كويتي ",
image:"images/2024_02_19_23_30_IMG_7236.JPG",
images: 'images/2024_02_19_23_30_IMG_7236.JPG',
price: 3.5,
subtiltle: "عرف القطن الكويتي بخصائصه المميزة التي تجعله مرغوبًا بشدة في عالم الأقمشة. يتميز بنعومته الفائقة وخفته على البشرة،",
  selectedColor: hexToColor('#afa795'),
),


Product(
id: 4,
title:"شال لمعة ",
image:"images/black.JPG",
images: 'images/black.JPG',
price: 3.5,
subtiltle:  " تألقي بلمسة من الفخامة والإبهار مع شال لمعة من حرير، قطعة راقية تُضفي رونقًا خاصًا على إطلالتك وتُكمل أناقتك في مختلف المناسبات. ",
  selectedColor: hexToColor('#020202'),
),


Product(
id: 5,
title:"قطن مخطط ",
image:"images/liner coton pink.JPG",
images: 'images/liner coton pink.JPG',
price: 3.5,
subtiltle: "حرير يقدم لك تشكيلة رائعة من أقمشة القطن المخططة، المصممة خصيصًا لتلبية احتياجاتك العصرية. تُصنع هذه الأقمشة من أجود أنواع القطن،"  
, selectedColor: hexToColor('#80576c'),
),


Product(
id: 6,
title:"مونس بالستراس ",
image:"images/ramadi.JPG",
images: 'images/ramadi.JPG',
price: 3.5,
subtiltle: 'يتميز شال متجر حرير : بتصميمه الفريد المرصع بحبات ستراس براقة تضفي لمسة من الأناقة والتألق على إطلالتك. مصنوع من أجود أنواع القطن ',
  selectedColor: hexToColor('#ac8b7f'),
),

Product(
id: 7,
title:"قطن دبل ستريتش ",
image:"images/double_strich.jpeg",
images: 'images/double_strich.jpeg',
price: 3.5,
subtiltle: " استمتعي براحة القطن الطبيعي مع لمسة من الأناقة مع شال قطن دبل ستريتش من حرير. يتميز هذا الشال بنعومته الفائقة ومرونته المميزة،",
  selectedColor: hexToColor('#fefffc'),
),



Product(
id: 8,
title:"ساتان ",
image:"images/satan.jpeg",
images: 'images/satan.jpeg',
price: 3.5,
subtiltle: 'متجر حرير : يقدم لك شال ساتان الحرير ناعم ولامع يضفي لمسة من الفخامة والأناقة على أي إطلالة ',
  selectedColor: hexToColor('#575d60'),
),


Product(
id: 9,
title:"سواريه ",
image:"images/pink_swarih.jpeg",
images: 'images/pink_swarih.jpeg',
price: 3.5,
subtiltle: " تُقدم لكِ حرير، متجر الأزياء الراقية، شال السواريه المصنوع من أجود أنواع القطن الطبيعي، لِتتألقي بإطلالة ساحرة في أمسياتكِ المميزة.",
  selectedColor: hexToColor('#fff5f0'),
),



Product(
id: 10,
title:"شيفون مطرز ",
image:"images/shifon_motraz.jpeg",
images: 'images/shifon_motraz.jpeg',
price: 3.5,
subtiltle: "تُقدّم لكِ حرير تشكيلةً ساحرةً من أقمشة الشيفون المطرزة، التي تُضفي على إطلالتكِ لمسةً من الرقيّ والفخامة ",
  selectedColor: hexToColor('#855668'),
),



Product(
id: 11,
title:"كشمير بستراس ",
image:"images/kashmir.jpeg",
images: 'images/kashmir.jpeg',
price: 3.5,
subtiltle: 'شالات الكشمير بستراس القطن التي تُضفي لمسة من الفخامة والأناقة على إطلالتكِ، سواءً كنتِ تُفضّلين الأسلوب الكلاسيكي أو العصري ' ,
  selectedColor: hexToColor('#9f8872'),
),

Product(
id: 12,
title:"ليكرا مجكر ",
image:"images/likra mjaker.jpeg",
images: 'images/likra mjaker.jpeg',
price: 3.5,
subtiltle: "حرير يقدم لك تشكيلة رائعة من قماش الليكرا المجكر بألوانه الزاهية وتصاميمه المتنوعة التي تُضفي لمسة من الأناقة والجمال على إطلالتك",
  selectedColor:hexToColor('#000100'),
),


Product(
id: 13,
title:"شال لونين ",
image:"images/lonen.JPG",
images: 'images/lonen.JPG',
price: 3.5,
subtiltle: "شال لونين من حرير هو قطعة أساسية لا غنى عنها في خزانة كل امرأة. يتميز هذا الشال بتصميمه الأنيق وألوانه الجذابة التي تناسب جميع المناسبات.",
  selectedColor: hexToColor('#000010'),
),


Product(
id: 14,
title:"ساتان و جورجيت ",
image:"images/satan+gorget.JPG",
images: 'images/satan+gorget.JPG',
price: 3.5,
subtiltle: " حرير يقدم لك شال ساتان و جورجيت، قطعة استثنائية تجمع بين الفخامة والرقة لتُضفي لمسة مميزة على إطلالتك. ",
  selectedColor: hexToColor('#001000'),
),


Product(
id: 15,
title:"قطن مسكر ",
image:"images/cottob mskar.jpeg",
images: 'images/cottob mskar.jpeg',
price: 3.5,
subtiltle: " شال قطن مسكر من متجر حرير: لمسة من الأناقة والراحة! مصنوع من أجود أنواع القطن، بتصميم عصري وألوان متنوعة، سهل التنظيف",
  selectedColor: hexToColor('#010000'),


),



Product(
id: 16,
title:"قطن روز ",
image:"images/likra_mskar.jpg",
images: 'images/likra_mskar.jpg',
price: 3.5,
subtiltle: " شال قطن روز من متجر حرير: لمسة من الأناقة والحيوية!مرونة عالية ومقاومة للتجاعيد، بتصميمات عصرية وألوان نابضة بالحياة،",
  selectedColor: hexToColor('#100000'))

,
Product(
id: 17,
title:"شال ليورية جلاتر ",
image:"images/lyorah_glutter.jpeg",
images: 'images/lyorah_glutter.jpeg',
price: 3.5,
subtiltle: "شال ليورية جلاتر من متجر حرير: لمسة من الفخامة! نعومة فائقة ولمعان براق بتصميم أنيق وجذاب، بألوان فخمة تليق بجميع المناسبات ",
  selectedColor: hexToColor('#92868f'),),


  Product(
    id: 18,
    title: 'تنورة قميص ',
    images: "images/tnora.jpeg",
    image: "images/tnora.jpeg",
    price: 3.5,
    subtiltle:
        ". تتميز تنورتنا بتصميمها الفريد الذي يجعلها مناسبة لمختلف المناسبات، من العمل إلى النزهات اليومية. ",
    selectedColor: hexToColor('#fffeff')
    // Set the initial color here
  ),


  Product(
    id: 19,
    title: 'حجاب النينجا ',
    images: "images/7iab ninja.jpeg",
    image: "images/7iab ninja.jpeg",
    price: 3.5,
    subtiltle:
        'يقدم لك حرير متجر الشالات الراقي حجاب النينجا الأروع لإطلالتك و الأكثر أناقة ',
         selectedColor: hexToColor('#f3f4f9')
    // Set the initial color here
  ),

  Product(
    id: 20,
    title: 'قبة قميص ',
    images: "images/kapa kamis.jpeg",
    image: "images/kapa kamis.jpeg",
    price: 3.5,
    subtiltle:
        "قبة قميص حرير: لمسة أناقة عصرية على رقبتك. تنوع في التصميمات والألوان، راحة فائقة، وأقمشة عالية الجودة.",
    selectedColor: hexToColor('#fccfff')
    // Set the initial color here
  ),

    Product(
    id: 21,
    title: 'قبة هاينك ',
    images: "images/kapa_hinek.jpeg",
    image: "images/kapa_hinek.jpeg",
    price: 3.5,
    subtiltle:
        "تقدم لكِ حرير، متجر الأزياء الراقية، قبة هاينك، قطعة دافئة وأنيقة تُكمل إطلالتكِ  بأروع ما يكون ",
    selectedColor: hexToColor('#fffffe')
    // Set the initial color here
  ),


      Product(
    id: 22,
    title: 'معصم قطن ازرار ',
    images: 'images/m3sam zrar.jpeg',
    image: "images/m3sam zrar.jpeg",
    price: 2.5,
    subtiltle:
        "معصم قطن بأزرار من حرير: لمسة راحة وأناقة على معصمك ",
    selectedColor: hexToColor('#f5f6ff')
    // Set the initial color here
  ),


       Product(
    id: 23,
    title: 'معصم قطن زم ',
    images: 'images/mo3sam zm.jpeg',
    image: "images/mo3sam zm.jpeg",
    price: 2.5,
    subtiltle:
        "تُقدم لكِ حرير، متجر الأزياء الراقية، معصم قطن زم، قطعة مميزة تجمع بين الأناقة والراحة في آن واحد.",
    selectedColor: hexToColor('#f3f3fb')
    // Set the initial color here
  ),

         Product(
    id: 24,
    title: 'حجاب طباقي ',
    images: 'images/hijab_tbaqe.jpeg',
    image: "images/hijab_tbaqe.jpeg",
    price: 3,
    subtiltle:
       'حجاب حرير الطباقي: أناقة عصرية وراحة فائقة. تصميم فريد يجمع بين الأناقة والبساطة، تنوع في الألوان والأنماط، جودة عالية، مناسب لمختلف المناسبات.',
            selectedColor: hexToColor('#f2f2f2')
    // Set the initial color here
  ),

];




