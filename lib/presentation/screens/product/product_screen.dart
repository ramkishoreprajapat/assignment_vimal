import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/strings.dart';
import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../../logic/bloc/product_bloc/product_bloc.dart';
import '../../../logic/cubit/theme_cubit.dart';
import '../widgets/custom_scaffold.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isDarkTheme = false;
  @override
  void initState() {
    super.initState();
    refreshTask();
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    isDarkTheme = themeCubit.state == ThemeMode.dark ? true : false;
    return CustomScaffold(
        appBartitle: Strings.products,
        costomScaffoldEnum: CustomScaffoldEnum.scaffoldWithSafeAreaWithAppBar,
        leading: const Icon(
          Icons.account_circle,
          size: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeCubit.toggleTheme();
              setState(() {
                isDarkTheme = !isDarkTheme;
              });
            },
            icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
          )
        ],        
        safeAreaChild: BlocBuilder<ProductBloc, ListProductState>(
          builder: (context, state) {
            if (state is ListProductSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: state.productList!.isEmpty
                    ? const Expanded(
                        child: Center(child: Text(Strings.notProductAddedYet)))
                    : ListView.builder(
                        itemCount: state.productList!.length,
                        itemBuilder: (context, index) {
                          var item = state.productList![index];
                          var price = '${Strings.rs} ${double.parse(item.price)}';
                          return Card(
                            child: ListTile(
                              title: Text(
                                item.name.length > 24
                                    ? '${item.name.substring(0, 24)}...'
                                    : item.name,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              subtitle: Text(
                                  price.length > 24
                                      ? '${price.substring(0, 24)}...'
                                      : price,
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 16)),                              
                                  trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_outline),
                            ),
                          );
                        }),
              );
            } else {
              return const Expanded(
                  child: Center(child: Text(Strings.loading)));
            }
          },
        ));
  }
  void refreshTask() {
    context.read<ProductBloc>().add(const RefreshProductRequired());
  }
}
