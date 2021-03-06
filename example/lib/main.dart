import 'package:flutter/material.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpointsProvider(
      child: MaterialApp(
        title: "Responsive app",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.white.withOpacity(0.9),
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: ResponsivePage(),
        ),
      ),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      xs: const EdgeInsets.all(8),
      md: const EdgeInsets.all(12),
      child: ResponsiveFlex(
        direction: const BreakpointsData(
          xs: Axis.vertical,
          md: Axis.horizontal,
        ),
        crossAxisAlignment: const BreakpointsData(md: CrossAxisAlignment.stretch),
        children: [
          ResponsiveFlexible(
            md: const ResponsiveExpandedData(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ColoredBox(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Responsive app title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ResponsiveSizedBox(
                  xs: const ResponsiveSizedBoxData(height: 16),
                  md: const ResponsiveSizedBoxData(height: 20),
                ),
                for (int i = 0; i < 4; i++)
                  ResponsivePadding(
                    xs: const EdgeInsets.symmetric(vertical: 4),
                    md: const EdgeInsets.symmetric(vertical: 8),
                    child: ColoredBox(
                      color: Colors.deepPurpleAccent.withOpacity(0.5),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Card title",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          ResponsiveSizedBox(
            xs: const ResponsiveSizedBoxData(height: 16),
            md: const ResponsiveSizedBoxData(width: 12),
          ),
          ColoredBox(
            color: Colors.deepPurple.withOpacity(0.75),
            child: ResponsivePadding(
              xs: const EdgeInsets.all(12),
              md: const EdgeInsets.all(20),
              child: ResponsiveFlex(
                direction: const BreakpointsData.all(Axis.vertical),
                crossAxisAlignment: const BreakpointsData(
                  xs: CrossAxisAlignment.stretch,
                  md: CrossAxisAlignment.center,
                ),
                children: [
                  Text(
                    ResponsiveBreakpointsProvider.of(context).pick(
                      xs: "xs sidebar title",
                      md: "md sidebar title",
                      xl: "xl sidebar title",
                    ),
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
