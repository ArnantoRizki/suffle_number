import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_board.dart';
import 'home_button.dart';
import '../../blocs/geser_bloc/geser_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeserBloc>(
      create: (context) => GeserBloc(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({ Key? key }) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeserBloc, GeserBlocState>(
      builder: (context, state){
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),

                HomeBoard(
                  squares: state.repository.squares,
                  onTapSquare: (square){
                    BlocProvider.of<GeserBloc>(context).add(GeserBlocEventPindah(square));
                  },
                ),

                const Spacer(),

                HomeButton(
                  onTap: (){
                    BlocProvider.of<GeserBloc>(context).add(GeserBlocEventRandomize());
                  },
                ),

                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}