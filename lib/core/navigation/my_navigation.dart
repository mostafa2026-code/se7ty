import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void push(BuildContext context, String to , Object? extra) {
  context.push( to, extra: extra);
  
}
void pushreplace(BuildContext context, String to , Object? extra) {
  context.pushReplacement( to, extra: extra);
  
}
void pop(BuildContext context, String to , Object? extra) {
  context.pop();
  
}
void goBase(BuildContext context, String to , Object? extra) {
  context.go( to, extra: extra);
  
}