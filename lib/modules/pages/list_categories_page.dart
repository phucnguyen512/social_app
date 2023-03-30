import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/blocs/list_categories_bloc.dart';
import 'package:social_app/modules/models/category.dart';

class ListCategoriesPage extends StatelessWidget {
  ListCategoriesPage({Key? key}) : super(key: key);

  final _categoryBloc = ListCategoresBloc();

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List categories page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: _buildLogo(),
        onPressed: () {
          _categoryBloc.add('getCategories');
        },
      ),
      body: BlocBuilder<ListCategoresBloc, List<Category>?>(
        bloc: _categoryBloc,
        builder: (context, categories) {
          if (categories != null) {
            return ListView.builder(
              itemBuilder: (_, int index) {
                final item = categories![index];
                final name = item.title;
                return Text('$name');
              },
              itemCount: categories?.length ?? 0,
            );
          }
          // if (snapshot.hasError) {
          //   return Center(
          //     child: Text(snapshot.error.toString()),
          //   );
          // }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: 64,
      height: 64,
      child: Image.asset('assets/images/flutter_logo.png'),
    );
  }
}
