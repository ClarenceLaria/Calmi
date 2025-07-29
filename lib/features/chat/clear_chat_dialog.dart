import 'package:flutter/material.dart';

void showClearChatDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    ),
    backgroundColor: Colors.white,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(
              'Clear Chat',
              style: TextStyle(
                color: Colors.red,
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Divider(
              color: Colors.grey[200],
              thickness: 1,
            ),
            SizedBox(height: 8),
            Text(
              'Sure you want to clear the chat?\nThis action cannot be undone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 16),
            Divider(
              color: Colors.grey[200],
              thickness: 1,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor.withAlpha(50),
                      side: BorderSide(color: Theme.of(context).primaryColor.withAlpha(50)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Yes. Clear Chat',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}
