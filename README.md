SimplePurchase
==============

SimplePurchase is a lightweight wrapper for in-app purchases on the iOS
platform.  It is inspired by Parse's in-app purchase API.  However, unlike
Parse, SimplePurchase:

* Does not do as much.  No verification of receipts, handling of downloadable
  content, etc.
* Does not depend on external libraries, e.g., Facebook.
* Is available as a CocoaPod.

Installation
============

Add the following to your Podfile and run the `pod` command to install:

    pod 'SimplePurchase', '~> 0.0.1'

If you're not using CocoaPods, copy all of the files inside the Classes
subdirectory into your project.

Example Usage
=============

First, register an observer for your product:

    [SimplePurchase addObserverForProduct:@"com.example.MyApp.pro"
                                    block:^(SKPaymentTransaction *transaction)
    {
        // the purchase has been made; make a record of it and perform whatever
        // changes neccessary in the app.
    }];

Second, perform the purchase and notify the user of any error:

    [SimplePurchase buyProduct:@"com.example.MyApp.pro" block:^(NSError *error)
     {
        if (error)
        {
            [[[UIAlertView alloc] initWithTitle:@"Purchase Error"
                                        message:error.localizedDescription
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
     }];
