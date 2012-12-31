//
//  CovenantNotificationCenter.m
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CovenantNotificationCenter.h"

#import "CovenantNotification.h"

@implementation CovenantNotificationCenter

-(id) init {
    self = [super init];
    if (self) {
        [self listenForNotifications];
    }
    return self;
}

-(void) test {
    NSNotificationCenter *ntCenter = [NSNotificationCenter defaultCenter];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_SIGNUP_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_SIGNUP_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_SIGNIN_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_SIGNIN_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_BOOKS_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_BOOKS_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_MY_BOOKS_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_MY_BOOKS_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_OK object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_BOOKS_SUMMARY_RESULT_FAILED object:nil];
    [ntCenter addObserver:self selector:@selector(testHandler:) name:COVNOTIFICATION_GET_BOOKS_SUMMARY_RESULT_OK object:nil];
}

-(void) testHandler:(NSNotification *) notification {
   // NSLog(@"Got notification... %@", notification);
}

-(void) listenForNotifications {
    
    [self test];

    NSNotificationCenter *ntCenter = [NSNotificationCenter defaultCenter];
    
    [ntCenter addObserver:self selector:@selector(handleSignUpNotification:) name:COVNOTIFICATION_SIGNUP object:nil];
    [ntCenter addObserver:self selector:@selector(handleSignInNotification:) name:COVNOTIFICATION_SIGNIN object:nil];
    [ntCenter addObserver:self selector:@selector(handleSignOutNotification:) name:COVNOTIFICATION_SIGNOUT object:nil];
    [ntCenter addObserver:self selector:@selector(handleActivateAccountNotification:) name:COVNOTIFICATION_ACCOUNT_ACTIVATE object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetAccountInfoNotification:) name:COVNOTIFICATION_GET_ACCOUNT_INFO object:nil];
    [ntCenter addObserver:self selector:@selector(handleUpdateAccountInfoNotification:) name:COVNOTIFICATION_UPDATE_ACCOUNT_INFO object:nil];
    [ntCenter addObserver:self selector:@selector(handleChangePasswordNotification:) name:COVNOTIFICATION_CHANGE_PASSWORD object:nil];
    [ntCenter addObserver:self selector:@selector(handleResetPasswordNotification:) name:COVNOTIFICATION_RESET_PASSWORD object:nil];
    [ntCenter addObserver:self selector:@selector(handleUpdateDeviceNameNotification:) name:COVNOTIFICATION_UPDATE_DEVICE_NAME object:nil];
    [ntCenter addObserver:self selector:@selector(handleUnlinkDeviceNotification:) name:COVNOTIFICATION_UNLINK_DEVICE object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetCatalogueNotification:) name:COVNOTIFICATION_GET_CATALOGUE object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetCatalogueBooksNotification:) name:COVNOTIFICATION_GET_CATALOGUE_BOOKS object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetCatalogueQuickBooksNotification:) name:COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS object:nil];
    [ntCenter addObserver:self selector:@selector(handleBookPurchasedNotification:) name:COVNOTIFICATION_BOOK_PURCHASED object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetTransactionHistoryNotification:) name:COVNOTIFICATION_GET_TRANSACTION_HISTORY object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetMyBooksNotification:) name:COVNOTIFICATION_GET_MY_BOOKS object:nil];
    [ntCenter addObserver:self selector:@selector(handleDownloadBookNotification:) name:COVNOTIFICATION_DOWNLOAD_BOOK object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetBookDetailsNotification:) name:COVNOTIFICATION_GET_BOOK_DETAILS object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetBooksSummaryNotification:) name:COVNOTIFICATION_GET_BOOKS_SUMMARY object:nil];
    [ntCenter addObserver:self selector:@selector(handleLikeBookNotification:) name:COVNOTIFICATION_LIKE_BOOK object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetMyLikesNotification:) name:COVNOTIFICATION_GET_MY_LIKES object:nil];
    [ntCenter addObserver:self selector:@selector(handleUnlikeBookNotification:) name:COVNOTIFICATION_UNLIKE_BOOK object:nil];
    [ntCenter addObserver:self selector:@selector(handleAddToWishListNotification:) name:COVNOTIFICATION_ADD_TO_WISHLIST object:nil];
    [ntCenter addObserver:self selector:@selector(handleGetMyWishListNotification:) name:COVNOTIFICATION_GET_MY_WISHLIST object:nil];
    [ntCenter addObserver:self selector:@selector(handleRemoveFromWishListNotification:) name:COVNOTIFICATION_REMOVE_FROM_WISHLIST object:nil];
}

#pragma mark - handle signup
-(void) handleSignUpNotification:(NSNotification *) notification { }

#pragma mark - handle signin
-(void) handleSignInNotification:(NSNotification *) notification { }

#pragma mark - handle signout
-(void) handleSignOutNotification:(NSNotification *) notification { }

#pragma mark - handle account activation
-(void) handleActivateAccountNotification:(NSNotification *) notification { }

#pragma mark - handle get account info 
-(void) handleGetAccountInfoNotification:(NSNotification *) notification { }

#pragma mark - update account info
-(void) handleUpdateAccountInfoNotification:(NSNotification *) notification { }

#pragma mark - change password
-(void) handleChangePasswordNotification:(NSNotification *) notification { }

#pragma mark - reset password
-(void) handleResetPasswordNotification:(NSNotification *) notification { }

#pragma mark - update device name
-(void) handleUpdateDeviceNameNotification:(NSNotification *) notification { }

#pragma mark - unlink device
-(void) handleUnlinkDeviceNotification:(NSNotification *) notification { }

#pragma mark - get catalog
-(void) handleGetCatalogueNotification:(NSNotification *) notification { }

#pragma mark - get catalog books
-(void) handleGetCatalogueBooksNotification:(NSNotification *) notification { }


#pragma mark - get catalog quick books
-(void) handleGetCatalogueQuickBooksNotification:(NSNotification *) notification { }

#pragma mark - book purchased
-(void) handleBookPurchasedNotification:(NSNotification *) notification { }

#pragma mark - txn history
-(void) handleGetTransactionHistoryNotification:(NSNotification *) notification { }

#pragma mark - get my books
-(void) handleGetMyBooksNotification:(NSNotification *) notification { }

#pragma mark - download book
-(void) handleDownloadBookNotification:(NSNotification *) notification { }

#pragma mark - get book details
-(void) handleGetBookDetailsNotification:(NSNotification *) notification { }

#pragma mark - get book summary
-(void) handleGetBooksSummaryNotification:(NSNotification *) notification { }

#pragma mark - like a book
-(void) handleLikeBookNotification:(NSNotification *) notification { }

#pragma mark - get my likes 
-(void) handleGetMyLikesNotification:(NSNotification *) notification { }

#pragma mark - unlike a book
-(void) handleUnlikeBookNotification:(NSNotification *) notification { }

#pragma mark - add to wishlist
-(void) handleAddToWishListNotification:(NSNotification *) notification { }

#pragma mark - get wishlist
-(void) handleGetMyWishListNotification:(NSNotification *) notification { }

#pragma mark - remove from wishlist
-(void) handleRemoveFromWishListNotification:(NSNotification *) notification { }

@end
