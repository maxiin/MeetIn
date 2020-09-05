import 'package:events_app/cubit/navigation_cubit.dart';
import 'package:events_app/pages/dashboard.dart';
import 'package:events_app/pages/events.dart';
import 'package:events_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage() : super();

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = BottomNavigationCubit();

    return Scaffold(
        bottomNavigationBar:
            BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
                cubit: cubit,
                builder: (BuildContext context, BottomNavigationState data) {
                  return BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.dashboard),
                          title: Text('New Events')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.confirmation_number),
                          title: Text('Confirmed')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), title: Text('Profile')),
                    ],
                    currentIndex: data.index,
                    onTap: cubit.changePage,
                  );
                }),
        body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            cubit: cubit,
            builder: (BuildContext context, BottomNavigationState data) {
              /// `data.runtimeType` is similar to `data is Type`
              switch (data.runtimeType) {
                case NavigationLoading:
                  return CircularProgressIndicator();
                case NavigationEvents:
                  return EventsPage();
                case NavigationDashboard:
                  return DashboardPage();
                case NavigationProfile:
                  return ProfilePage();
                default:
                  return Text('error');
              }
            })
        //body: _currentPage,
        );
  }
}
