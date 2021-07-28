          Container(
            color: Colors.amber,
            width: double.infinity,
            height: 300,
            child: CustomPaint(
              painter: OurPainter(),
            ),
          ),


 LayoutBuilder(
            builder: (_, constraints) => Container(
              width: constraints.widthConstraints().maxWidth,
              height: constraints.heightConstraints().maxHeight,
              color: Colors.amber,
              child: CustomPaint(painter: OurPainter()),
            ),
          ),


