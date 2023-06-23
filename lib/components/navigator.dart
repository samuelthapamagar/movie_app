//These functions are created just to navigate between pages easily

import 'package:flutter/material.dart';

nextPage(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

nextPageReplacement(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
