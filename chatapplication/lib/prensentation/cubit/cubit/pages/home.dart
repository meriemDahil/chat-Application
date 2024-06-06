import 'package:chatapplication/prensentation/cubit/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late InternetCubit internetCubit;
  @override
  void initState() {
    internetCubit = context.read<InternetCubit>();
    internetCubit.checkConnectivity();
    internetCubit.trackConnectivityChange();
    super.initState();
  }
  @override
  void dispose() {
    internetCubit.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      



    );
  }
}