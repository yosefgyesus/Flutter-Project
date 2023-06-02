import 'package:finalproject/application/user/greeting/greeting_bloc.dart';
import 'package:finalproject/application/user/greeting/greeting_state.dart';
import 'package:finalproject/domain/user/greeting/greeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greetings'),
      ),
      body: BlocBuilder<GreetingBloc, GreetingState>(
        builder: (context, state) {
          if (state is GreetingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GreetingLoaded) {
            return ListView.builder(
              itemCount: state.greetings.length,
              itemBuilder: (context, index) {
                final greeting = state.greetings[index];
                return GreetingItem(greeting: greeting);
              },
            );
          } else if (state is GreetingFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class GreetingItem extends StatefulWidget {
  final Greeting greeting;

  const GreetingItem({super.key, required this.greeting});

  @override
  // ignore: library_private_types_in_public_api
  _GreetingItemState createState() => _GreetingItemState();
}

class _GreetingItemState extends State<GreetingItem> {
  bool isFlipped = false;

  void flipCard() {
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: flipCard,
        child: Container(
          height: 200,
          padding: EdgeInsets.all(16),
          child: isFlipped
              ? BackSide(greeting: widget.greeting)
              : FrontSide(greeting: widget.greeting),
        ),
      ),
    );
  }
}

class FrontSide extends StatelessWidget {
  final Greeting greeting;

  const FrontSide({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greeting.greeting,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {},
          child: Text('Show Definition'),
        ),
      ],
    );
  }
}

class BackSide extends StatelessWidget {
  final Greeting greeting;

  const BackSide({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greeting.meaning,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          greeting.example,
          style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
