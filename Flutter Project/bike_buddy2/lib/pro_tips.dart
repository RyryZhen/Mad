import 'package:bike_buddy2/Data/pro_tips.dart';
import 'package:bike_buddy2/Models/pro_tips.dart';
import 'package:flutter/material.dart';

//lib\pro_tips.dart
class ProTipScreen extends StatefulWidget {
  final ProTip tip;
  final bool initialIsFavorited;
  final Future<void> Function(ProTip)? onToggleFavorite;

  const ProTipScreen({
    super.key,
    required this.tip,
    this.initialIsFavorited = false,
    this.onToggleFavorite,
  });

  @override
  State<ProTipScreen> createState() => _ProTipScreenState();
}

class _ProTipScreenState extends State<ProTipScreen> {
  late ProTip activeTip;

  @override
  void initState() {
    super.initState();
    activeTip = widget.tip;
  }

  @override
  Widget build(BuildContext context) {
    final List<ProTip> relatedTips =
        categorizedProTips[activeTip.category] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(activeTip.category),
        backgroundColor: activeTip.color,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
              decoration: BoxDecoration(
                color: activeTip.color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(activeTip.icon, size: 45, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    activeTip.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      activeTip.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "More ${activeTip.category} Tips",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,
                        ),
                    itemCount: relatedTips.length,
                    itemBuilder: (context, index) {
                      final item = relatedTips[index];
                      bool isCurrent = item.id == activeTip.id;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeTip = item;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isCurrent
                                ? activeTip.color.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isCurrent
                                  ? activeTip.color
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item.icon,
                                color: isCurrent
                                    ? activeTip.color
                                    : Colors.blue[600],
                                size: 30,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isCurrent
                                      ? activeTip.color
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
