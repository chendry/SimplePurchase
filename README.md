SimplePurchase
==============

SimplePurchase is a lightweight wrapper for in-app purchases on the iOS
platform.  It is inspired by Parse's in-app purchase API.  However, unlike
Parse, SimplePurchase:

* Does less.  No verification of receipts, no handling of downloadable content,
  no UI for a store, etc.
* Does not depend on the Facebook SDK.
* Is available as a CocoaPod.

Although Parse felt a little too heavy for the project from which this library
was extracted, I strongly suggest checking them out.  Here's a link to Parse's
in-app purchase [documentation](https://www.parse.com/docs/ios_guide#iap/iOS).

Installation
============

Add the following to your Podfile and run the `pod` command to install:

    pod 'SimplePurchase', '~> 0.0.1'

If you're not using CocoaPods, copy all of the files inside the Classes
subdirectory into your project.

Example Usage
=============

First, register an observer for your product.  This should be done right after
the app has launched:

    [SimplePurchase addObserverForProduct:@"com.example.MyApp.pro"
                                    block:^(SKPaymentTransaction *transaction)
    {
        // the purchase has been made; make a record of it and perform whatever
        // changes neccessary in the app.
    }];

Second, when the user has requested to make the purchase, initiate the purchase
and notify the user of any error:

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
