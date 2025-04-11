import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/I18n/translations.dart';

class DeLanguageData extends LanguageDataKeys {
  DeLanguageData();

  @override
  Map<String, String> get keys => {
        AppStrings.accept: "Annehmen",
        AppStrings.reject: "Ablehnen",
        AppStrings.addTag: "Tag hinzufügen",
        AppStrings.addTags: "Tags hinzufügen",
        AppStrings.searchNotFound: "keine Suchergebnisse",
        AppStrings.createNewProject: "Neues Projekt erstellen",
        AppStrings.editProject: "Projekt bearbeiten",
        AppStrings.addProjekt: "Neues Projekt",
        AppStrings.tags: "Tags:*",
        AppStrings.members: "Team",
        AppStrings.teamMembers: "Teammitglieder",
        AppStrings.addMembers: "Zum Team hinzufügen",
        AppStrings.next: "Weiter",
        AppStrings.edit: "Bearbeiten",
        AppStrings.close: "Schließen",
        AppStrings.done: "Fertig",
        AppStrings.required: "erforderlich",
        AppStrings.home: "Home",
        AppStrings.profile: "Profil",
        AppStrings.settings: "Einstellungen",
        AppStrings.projectTitle: "Projekttitel:*",
        AppStrings.projectTitleHint: "Geben Sie Ihrem Projekt einen Titel",
        AppStrings.desciption: "Beschreibung:",
        AppStrings.descriptionHint: "Gib eine Beschreibung ein",
        AppStrings.saveAsDraft: "Als Entwurf speichern",
        AppStrings.save: "Speichern",
        AppStrings.forgotPassword: "Passwort vergessen?",
        AppStrings.forgotPasswordHint:
            "Geben Sie Ihre E-Mailadresse ein. Wir senden Ihnen einen 4 stelligen Bestätigungscode.",
        AppStrings.emailHint: "Geben Sie Ihre E-Mailadresse ein",
        AppStrings.enterVerificationCode: "Bestätigungscode eingeben",
        AppStrings.enterVerificationCodeHint:
            "Geben Sie den 4 stelligen Code ein, den Sie per Mail bekommen haben.",
        AppStrings.didntReceiveCode: "Code nicht erhalten?",
        AppStrings.resendCode: "Erneut senden",
        AppStrings.verificationCodeNotCorrect:
            "Der eingegebene Code ist falsch",
        AppStrings.resetPassword: "Neues Passwort vergeben",
        AppStrings.resetPasswordHint:
            "Geben Sie ein neues Passwort für Ihren Account ein.",
        AppStrings.newPassword: "Neues Passwort",
        AppStrings.newPasswordHint: "Neues Passwort eingeben",
        AppStrings.reEnterNewPassword: "Neues Passwort erneut eingeben",
        AppStrings.reEnterPassword: "Passwort erneut eingeben",
        AppStrings.resetSuccesful: "Passwort erfolgreich geändert",
        AppStrings.findProjects: "Projekte suchen",
        AppStrings.projects: "Projekte",
        AppStrings.trendingTab: "Trends",
        AppStrings.latestTab: "Neu",
        AppStrings.favoritesTab: "Favoriten",
        AppStrings.openProject: "Projekt anzeigen",
        AppStrings.backToTop: "zurück nach oben",
        AppStrings.pullDownToRefresh: "zum Aktualisieren nach unten ziehen",
        AppStrings.emptyList:
            "Keine Ergebnisse; Aktualisieren für neue Projekte",
        AppStrings.selectLanguage: "Sprache wählen",
        AppStrings.english: "Englisch",
        AppStrings.german: "Deutsch",
        AppStrings.signIn: "Anmelden",
        AppStrings.userName: "Benutzername:",
        AppStrings.userNameHint: "Geben Sie Ihren Benutzernamen ein",
        AppStrings.password: "Passwort",
        AppStrings.passwordHint: "Geben Sie Ihr Passwort ein",
        AppStrings.clickHere: "Hier klicken",
        AppStrings.login: "Anmelden",
        AppStrings.signUpHere: "Hier registrieren",
        AppStrings.wrongCredentials:
            "Ihr Passwort oder der Nutzername ist falsch.",
        AppStrings.myProjects: "Mein Bereich",
        AppStrings.favorites: "Favoriten",
        AppStrings.interests: "Interessen:",
        AppStrings.addInterest: "Interesse hinzufügen",
        AppStrings.classes: "Kurse",
        AppStrings.addClasses: "Kurs hinzufügen",
        AppStrings.firstName: "Vorname",
        AppStrings.lastName: "Nachname",
        AppStrings.changePicture: "Bild bearbeiten",
        AppStrings.editProfile: "Profil bearbeiten",
        AppStrings.cancel: "Abbrechen",
        AppStrings.projectSuccesfullyCreated: "Projekt erfolgreich erstellt!",
        AppStrings.goToProjectProfile: "Projekt anzeigen",
        AppStrings.goToHomepage: "zur Startseite",
        AppStrings.owner: "Besitzer",
        AppStrings.likes: "Likes",
        AppStrings.like: "Like",
        AppStrings.comments: "Komentare",
        AppStrings.comment: "Komentar",
        AppStrings.copy: "kopieren",
        AppStrings.drafts: "Entwürfe",
        AppStrings.darkMode: "dunkler Modus",
        AppStrings.lightMode: "heller Modus",
        AppStrings.textSize: "Schriftgröße",
        AppStrings.language: "Sprache",
        AppStrings.privacy: "Privatsphäre",
        AppStrings.security: "Sicherheit",
        AppStrings.delete: "Löschen",
        AppStrings.deleteAccount: "Account löschen",
        AppStrings.deleteMaterial: "Material löschen",
        AppStrings.logout: "Abmelden",
        AppStrings.splashScreenText:
            "Bitte anmelden oder registrieren um fortzufahren",
        AppStrings.signUp: "Registrieren",
        AppStrings.addInterestHint: "Interessen finden",
        AppStrings.requestNewInterest:
            "Hier klicken um ein neues Interesse anzufragen",
        AppStrings.email: "E-Mailadresse",
        AppStrings.exitsitingAccount: "Schon registriert?",
        AppStrings.loginHere: "Hier anmelden",
        AppStrings.passwordCriteriaFailed:
            "Muss Zahlen und Sonderzeichen enthalten",
        AppStrings.profilePicture: "Profilbild:",
        AppStrings.finish: "Abschließen",
        AppStrings.textSizeSample: "Beispieltext zur Anzeige der Schriftgröße",
        AppStrings.thisFieldAreRequired: "Felder mit * sind erforderlich",
        AppStrings.here: "hier",
        AppStrings.alreadyHaveAnAccount: "Schon registriert?",
        AppStrings.iAgree: "Ich stimme zu mit den ",
        AppStrings.termsAndConditions: "Nutzungsbedingungen *.",
        AppStrings.isNotEmail: "E-Mail ist nicht gültig",
        AppStrings.passIsNotStrong: "Passwort ist nicht sicher",
        AppStrings.passIsNotMatch: "Passwörter stimmen nicht überein",
        AppStrings.couldNotBeEmpty: "Feld darf nicht leer sein",
        AppStrings.pleaseLoginOrSignUp:
            "Bitte melde dich an oder registriere dich um fortzufahren",
        AppStrings.resetIt: "Zurücksetzen ",
        AppStrings.dontHaveAnAccount: "Noch keinen Account?",
        AppStrings.isEmpty: "Feld darf nicht leer sein",
        AppStrings.studyPrograms: "Studiengänge:",
        AppStrings.addProgram: "Studiengang hinzufügen",
        AppStrings.search: "Suche",
        AppStrings.click: "Klick",
        AppStrings.addNewTagOrCourse: "Neues Tag oder Kurs hinzufügen.",
        AppStrings.toAddNew: "neues @name hinzufügen.",
        AppStrings.addNew: "Neues @name hinzufügen.",
        AppStrings.toAddNewTagOrCourse:
            "um ein neues Tag oder Kurs hinzuzufügen.",
        AppStrings.confirmationRequired: "Bestätigung erforderlich",
        AppStrings.skipRegistrationStepsMsg:
            "Sie haben die Möglichkeit, die Registrierungsschritte zu überspringen und sie später in Ihren Profileinstellungen zu vervollständigen.",
        AppStrings.okay: "OK",
        AppStrings.gallery: "Galerie",
        AppStrings.camera: "Kamera",
        AppStrings.registartionSuccessMsg:
            "Registrierung erfolgreich abgeschlossen 🎉",
        AppStrings.startUsingIdealize: "IdeaLize starten",
        AppStrings.newHome: "Neu",
        AppStrings.forYou: "Für dich",
        AppStrings.weeklyTrend: "Wöchentliche Trends",
        AppStrings.addNewProject: "Neues Projekt hinzufügen",
        AppStrings.or: "Oder",
        AppStrings.workOnAProjectFromDraft: "Arbeiten Sie an einem Entwurf:",
        AppStrings.emptyDraftProjectMessage: "Sie haben noch keine Enwürfe.",
        AppStrings.emptyFavoriteProject:
            "Sie haben noch keine Lieblingsprojekte.",
        AppStrings.emptyDraftProject:
            "Sie haben noch keine Entwürfe. \n Beginnen Sie mit der Erstellung eines neuen Projekts.",
        AppStrings.multiLineTextFieldHint: "Geben Sie Ihren Text hier ein",
        AppStrings.addLink: "Link hinzufügen",
        AppStrings.addLinkTitle: "Link Name",
        AppStrings.addLinkUrl: "URL hinzufügen",
        AppStrings.courses: "Kurse",
        AppStrings.addCourse: "Kurs hinzufügen",
        AppStrings.addCourses: "Kurse hinzufügen",
        AppStrings.files: "Dateien:",
        AppStrings.uploadFile: "Datei hochladen",
        AppStrings.uploadFiles: "Dateien hochladen",
        AppStrings.media: "Medien:",
        AppStrings.uploadMedia: "Medien hochladen",
        AppStrings.thumbnail: "Thumbnail:",
        AppStrings.uploadThumbnail: "Thumbnail hochladen",
        AppStrings.publish: "Veröffentlichen",
        AppStrings.emptyNotification: "Keine Benachrichtigungen.",
        AppStrings.notification: "Benachrichtigungen",
        AppStrings.clearAll: "Alle löschen",
        AppStrings.responseSent: "Antwort gesendet",
        AppStrings.responseSentMsg: "Antwort gesendet",
        AppStrings.firstNameHint: "Ihr Vorname",
        AppStrings.lastNameHint: "Ihr Nachname",
        AppStrings.backToHome: "Zurück zur Startseite",
        AppStrings.newProject: "Neues Projekt",
        AppStrings.addStudyPrograms: "Studiengänge hinz",
        AppStrings.projectDetails: "Projektdetails",
        AppStrings.aboutProject: "Über das Projekt",
        AppStrings.projectMaterials: "Projektmaterialien",
        AppStrings.noComments: "Keine Kommentare",
        AppStrings.noContributors: "Keine Mitwirkenden",
        AppStrings.joinProject: "Projekt beitreten",
        AppStrings.joinProjectPending:
            "Ihre Anfrage, dem Projekt beizutreten, wurde gesendet. Bitte warten Sie, bis der Projektbesitzer antwortet.",
        AppStrings.joinProjectAccepted: "Sie sind Teil des Projekts!",
        AppStrings.joinProjectCancelled: "Anfrage zum Beitritt abgebrochen",
        AppStrings.report: "Melden",
        AppStrings.tagNameValid: "Tag-Name muss gültig sein!",
        AppStrings.editInformation: "Informationen bearbeiten?",
        AppStrings.tooManyRequests:
            "Zu viele Anfragen, bitte versuchen Sie es später noch einmal!",
        AppStrings.enterValidEmail: "Bitte geben Sie eine gültige E-Mail ein",
        AppStrings.enterCodePassword: "Bitte Code und Passwort eingeben",
        AppStrings.passIsReset:
            "Ihr Passwort wurde zurückgesetzt, Sie werden in 3 Sekunden zur Anmeldeseite weitergeleitet.",
        AppStrings.profileUpdated: "Profil erfolgreich aktualisiert",
        AppStrings.profileUpdateFailed: "Profil kann nicht aktualisiert werden",
        AppStrings.downloadError:
            "Beim Herunterladen ist ein Fehler aufgetreten. Bitte versuchen Sie es später noch einmal.",
        AppStrings.downloadComplete: "Datei heruntergeladen auf:",
        AppStrings.requestSent:
            "Ihre Anfrage, dem Projekt beizutreten, wurde abgeschickt. Bitte warten Sie auf die Antwort des Projektinhabers.",
        AppStrings.ownerNotAvailable:
            "Der Projektinhaber ist nicht verfügbar. Bitte versuchen Sie es später noch einmal.",
        AppStrings.projectReported: "Das Projekt wurde gemeldet.",
        AppStrings.fillRequiredFields:
            "Bitte füllen Sie alle erforderlichen Felder korrekt aus",
        AppStrings.fileNotSupportedFormat:
            "Die Datei @keyword1 ist ein nicht unterstütztes Format",
        AppStrings.fileTooLarge: "Die Datei @keyword2 ist zu groß",
        AppStrings.noMediafileSelected: "Es wurde keine Mediendatei ausgewählt",
        AppStrings.maximumFilesReached:
            "Sie haben die maximale Anzahl an Dateien erreicht!",
        AppStrings.fileTooLargeNotSupportedFormat:
            "Die Datei @keyword3 ist zu groß oder ein nicht unterstütztes Format",
        AppStrings.noFileSelected: "Es wurde keine Datei ausgewählt",
        AppStrings.writeAComment: "Schreib einen Kommentar",
        AppStrings.noUsersToShow:
            "Es gibt keine Benutzer, die angezeigt werden können.\nBitte prüfen Sie später.",
        AppStrings.emptyHere: "Hier ist es leer!",
        AppStrings.fileUploadInfo: "File Upload Info",
        AppStrings.uploadInformation:
            "Sie können Dateien bis zu einer Größe von 10 MB hochladen. Unterstützte Formate sind PDF, DOC, PPT und PPTX.",
        AppStrings.fillAllFields: "Bitte füllen Sie alle Felder aus",
        AppStrings.sureAboutDeletingMaterial:
            "Sind Sie sicher, dass Sie das Material aus dem Projekt löschen wollen? Dadurch wird das Material dauerhaft aus dem Projekt gelöscht!",
        AppStrings.maximumMedias:
            "Sie haben die maximale Anzahl an Medien erreicht!",
        AppStrings.fileAlreadyAdded:
            "'Die Datei @keyword4 ist bereits hinzugefügt'",
        AppStrings.passwordInstructions:
            "Passwortanforderungen:\n- Mindestens 8 Zeichen\n- Mindestens ein Großbuchstabe\n- Mindestens eine Ziffer\n- Mindestens ein Sonderzeichen",
        AppStrings.termsCondifitonCheckbox:
            "Sie haben die Nutzungsbedingungen akzeptiert",
        AppStrings.tag: "Tag",
        AppStrings.course: "Kurs",
        AppStrings.studyProgram: "Studiengang",
        AppStrings.skip: "Speichern & Überspringen",
        AppStrings.photoAccessDenied:
            "Zugriff auf Fotos verweigert, bitte erlauben Sie den Zugriff in den Einstellungen",
        AppStrings.accessDenied: "Zugriff verweigert",
        AppStrings.okey: "OK",
        AppStrings.skipReqDesc:
            "Sie haben die Option, diese Schritte zu überspringen und sie später in Ihrem Profil hinzuzufügen.",
        AppStrings.noTitle: "Kein Titel",
        AppStrings.deleteProject: "Projekt löschen",
        AppStrings.deleteProjectContent:
            "Sind Sie sicher, dass Sie @projectKeyword löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden.",
        AppStrings.jrdTitle: "Join-Anfrage",
        AppStrings.jrdContent:
            "Indem Sie einem Projekt beitreten, können Sie daran teilnehmen und mit anderen Benutzern zusammenarbeiten. Sie können dem Projektinhaber eine Beitrittsanfrage senden, in der Sie angeben, warum Sie dem Projekt beitreten möchten und welche Motivation Sie dazu haben.",
        AppStrings.jrdContentHint: "Geben Sie Ihre Nachricht ein (Optional)",
        AppStrings.submit: "Senden",
        AppStrings.reply: "Antworten",
        AppStrings.replyTo: "Antworten an",
        AppStrings.hideComments: "Kommentare verbergen",
        AppStrings.showComments: "Kommentare anzeigen",
        AppStrings.deleteCommentTitle: "Kommentar löschen",
        AppStrings.deleteCommentContent:
            "Sind Sie sicher, dass Sie diesen Kommentar löschen wollen?",
        AppStrings.filePicker: "Dateiauswahl",
        AppStrings.mediaPicker: "Medienauswahl",
        AppStrings.unknown: "Unbekannt",
        AppStrings.descriptionWaring:
            "Die Beschreibung muss mindestens 100 Zeichen lang sein.",
        AppStrings.linksWarningMoreThan5:
            "Sie können nicht mehr als 5 Links hinzufügen.",
        AppStrings.permissionRequired: "Berechtigung erforderlich",
        AppStrings.permissionRequiredContent:
            "Bitte erlauben Sie in Ihren Einstellungen den Zugriff auf Fotos.",
        AppStrings.openSettings: "Einstellungen",
        AppStrings.reportBug: "Fehler melden",
        AppStrings.reportBugContent:
            "Sind Sie auf einen Fehler in der App gestoßen? Sie können ihn hier einfach melden. Bitte beschreiben Sie den Fehler für uns.",
        AppStrings.reportBugDesc:
            "Geben Sie Ihre Fehlerbeschreibung/Hinweise ein",
        AppStrings.addNewTag: "Neues Tag hinzufügen",
        AppStrings.addNewCourse: "Neuen Kurs hinzufügen",
        AppStrings.addNewStudyProgram: "Neues Studienprogramm hinzufügen",
        AppStrings.reportBugDescEmpty:
            "Bitte geben Sie Ihre Fehlerbeschreibung ein",
        AppStrings.tagName: "Tag-Name",
        AppStrings.add: "Hinzufügen",
        AppStrings.reportedSuccessTitle: "Erfolgreich gemeldet",
        AppStrings.reportedSuccessDesc:
            "Ihr Bericht wurde erfolgreich gesendet",
        AppStrings.somebodyBookmarkedyou:
            "@name hat Projekt @project bookmarked",
        AppStrings.somebodyLikedyou: "@name hat Projekt @project geliked",
        AppStrings.somebodyReportedyou: "@name hat Projekt @project gemeldet",
        AppStrings.somebodyCommentedyou:
            "@name hat auf Projekt @project kommentiert",
        AppStrings.notifBookmar: "Bookmark",
        AppStrings.notifLike: "Like",
        AppStrings.notifComment: "Kommentar",
        AppStrings.notifReport: "Melden",
        AppStrings.notifAddTeamMamber: "Team-Mitglied hinzufügen",
        AppStrings.notifJoinTeamMember: "Beitrittsanfrage",
        AppStrings.joinTeamMemberAcceptedByYou:
            "Sie haben @name zum Beitritt zu Projekt @project zugelassen",
        AppStrings.joinTeamMemberCanceledByYou:
            "Sie haben @name Beitrittsanfrage zu Projekt @project abgebrochen",
        AppStrings.joinTeamMemberAccepted:
            "@name hat Ihre Beitrittsanfrage auf Projekt @project akzeptiert",
        AppStrings.joinTeamMemberCanceled:
            "@name hat Ihre Beitrittsanfrage auf Projekt @project abgebrochen",
        AppStrings.joinTeamMember: "@name möchte Projekt @project beitreten",
        AppStrings.addTeamMember:
            "@name möchte Sie zu Projekt @project hinzufügen",
        AppStrings.addTeamMemberAccepted:
            "@name hat Ihre Beitrittsanfrage angenommen",
        AppStrings.addTeamMemberCanceled:
            "@name hat Ihre Beitrittsanfrage abgebrochen",
        AppStrings.addTeamMemberAcceptedByYou:
            "Sie haben angenommen, Teil von @project zu sein",
        AppStrings.addTeamMemberCanceledByYou:
            "Sie haben abgebrochen, Teil von @project zu sein",
        AppStrings.message: "Nachricht",
        AppStrings.deleteAccountDesc:
            "Bevor Sie Ihr Konto löschen, bedenken Sie die Auswirkungen auf unsere Community. Sie haben zwei Möglichkeiten:",
        AppStrings.deleteAccountDescOption0:
            "Option 1: Behalten Sie Ihren Kontonamen und Projekte für die Community sichtbar, löschen Sie jedoch Ihr Konto (E-Mail, Passwort). Dies ermöglicht anderen, von Ihren Beiträgen zu lernen und darauf aufzubauen.",
        AppStrings.deleteAccountDescOption1:
            "Option 2: Anonymisieren Sie Ihr Konto. Löschen Sie Ihre persönlichen Kontoinformationen, lassen Sie Ihre Projekte jedoch anonym im System. Dies hilft, das Ökosystem zu bewahren und ermöglicht anderen, aus Ihren Beiträgen zu lernen und darauf aufzubauen.",
        AppStrings.deleteAccountDescOption2:
            "Option 3: Löschen Sie dauerhaft alles. Entfernen Sie Ihr Konto und alle zugehörigen Projekte vollständig aus unserem System. Diese Aktion ist unwiderruflich und wird alle Ihre Daten löschen.",
        AppStrings.deleteAccountDesc2:
            "Bitte wählen Sie eine Option unten:\n\nSie könnten auch eine Warnung oder einen Hinweis hinzufügen, um die Endgültigkeit der Löschung zu betonen, zum Beispiel:\n\nHinweis: Sobald Sie Ihr Konto gelöscht haben, kann es nicht wiederhergestellt werden. Bitte stellen Sie sicher, dass Sie alle wichtigen Daten exportiert haben, bevor Sie fortfahren.",
        AppStrings.yesDelete: "Ja, lösche mein Konto",
        AppStrings.youHaveToChangeTheOwner:
            "Sie müssen den Eigentümer der Projekte ändern, bevor Sie Ihr Konto löschen.",
        AppStrings.connectionProblem: "Verbindungsproblem",
        AppStrings.project: "Projekt",
        AppStrings.draft: "Entwurf",
        AppStrings.editAndSave: "Bearbeiten und speichern",
        AppStrings.success: "Erfolg",
        // Dialog
        AppStrings.dailogAddLinksTitle: "Links hinzufügen",
        AppStrings.dailogAddLinksContent:
            "Die Links können auf der Projektseite angezeigt werden, wie z.B. GitHub, LinkedIn usw.",
        AppStrings.dailogAddTagsTitle: "Tags hinzufügen",
        AppStrings.dailogAddTagsContent:
            "Fügen Sie Tags zum Projekt hinzu, um es einfacher zu finden.",
        AppStrings.dailogAddCoursesTitle: "Kurse hinzufügen",
        AppStrings.dailogAddCoursesContent:
            "Fügen Sie Kurse zum Projekt hinzu, um es einfacher zu finden.",
        AppStrings.dailogAddTeamMemberTitle: "Team-Mitglied hinzufügen",
        AppStrings.dailogAddTeamMemberContent:
            "Sie können Mitglieder zum Projekt hinzufügen, um an der Arbeit mitzuwirken und mehr.",
        AppStrings.deleteAccountKeepData: "Behalte meine Daten",
        AppStrings.deleteAccountAnanymize: "Anonymisieren Sie mein Konto",
        AppStrings.deleteAccountComplete: "Mein Konto dauerhaft löschen",
        AppStrings.deleteAccountOption0Desc:
            "Gute Wahl!\n\n Wir behalten den Namen Ihres Kontos und die Projekte sichtbar für die Community, löschen jedoch Ihr Konto (E-Mail, Passwort). Dies ermöglicht anderen, von Ihren Beiträgen zu lernen und darauf aufzubauen.",
        AppStrings.deleteAccountOption1Desc:
            "Gute Wahl!\n\n Jetzt benötigen wir Ihre Bestätigung, um Ihr Konto zu löschen. Bitte tippen Sie auf die Schaltfläche unten, um einen Bestätigungscode an Ihre E-Mail zu senden.",
        AppStrings.deleteAccountOption0Button: "Bestätigungscode senden",
        AppStrings.deleteAccountOption1Button: "Bestätigungscode senden",
        AppStrings.deleteAccountOption0TextField: "Code eingeben",
        AppStrings.deleteAccountOption1TextField: "Code eingeben",
        AppStrings.deleteAccountOption2Desc:
            "Okey, machen wir es!\n\nJetzt benötigen wir Ihre Bestätigung, um Ihr Konto zu löschen. Bitte tippen Sie auf die Schaltfläche unten, um einen Bestätigungscode an Ihre E-Mail zu senden.",
        AppStrings.deleteAccountOption3Desc:
            "Ups, Sie haben einige Projekte, mit Team-Mitgliedern, bitte entfernen Sie sie, oder ändern Sie den Eigentümer, bevor Sie Ihr Konto löschen.",
        AppStrings.pickMember: "Mitglied auswählen",
        AppStrings.rightsForMedia:
            "Ich bestätige, dass ich das Recht habe, die von mir hochgeladenen Bilder oder Links zu verwenden.",
        AppStrings.mediaStoredPlace:
            "Speicherort für Medien\nAndroid: Hochgeladene Bilder und Medien werden auf Ihrem Gerät unter _____ gespeichert.\niPhone: Hochgeladene Bilder und Medien werden auf Ihrem Gerät unter _____ gespeichert.\nDer genaue Speicherort kann je nach Gerätemodell und Betriebssystemversion variieren.",
        AppStrings.pickMoreThan3Error:
            "Sie können nicht mehr als @count @name auswählen",
        AppStrings.minimum100Characters:
            "muss mindestens 100 Zeichen lang sein.",
        AppStrings.enterYourEmailAdr: "E-Mail-Adresse eingeben",
        AppStrings.enterYourPassword: "Passwort eingeben",
        AppStrings.resetPasswordCaption:
            "Geben Sie Ihre E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts",
        AppStrings.alreadyReported: "Bereits gemeldet",
        AppStrings.alreadyReportedCaption:
            "Sie haben dieses Projekt bereits gemeldet.",
        AppStrings.reportReason:
            "Bitte geben Sie den Grund für die Meldung dieses Projekts an. Wir werden Ihren Bericht überprüfen und erforderliche Maßnahmen ergreifen.",
        AppStrings.reason: "Grund",
        AppStrings.enterYourReason: "Geben Sie Ihren Grund ein",
        AppStrings.createNewProjectStepTwoCaption:
            "Ihr Projekt wird erfolgreicher, wenn Sie einige Tags, Team-Mitglieder oder Links hinzufügen.",
        AppStrings.createNewProjectStepThreeCaption:
            "Das Hinzufügen von mehr Informationen wie Dateien, Medien und Miniaturansicht kann Ihr Projekt attraktiver machen.",
        AppStrings.links: "Links",
        AppStrings.noLinksAvailable: "Keine Links verfügbar!",
        AppStrings.mediaFiles: "Medien-Dateien",
        AppStrings.noMediaAvailable: "Keine Medien verfügbar!",
        AppStrings.documentFiles: "Dokument-Dateien",
        AppStrings.noDocumentFilesAvailable:
            "Keine Dokument-Dateien verfügbar!",
        AppStrings.timeLeft: "Verbleibende Zeit: @time",
        AppStrings.signUpStep2InterestsCaption:
            "Wählen Sie die Themen aus, die Sie am meisten interessieren",
        AppStrings.signUpStep2StudyProgramsCaption:
            "Wählen Sie Ihre Studiengänge aus",
        AppStrings.reportComment: "Kommentar melden",
        AppStrings.commentReportReason:
            "Bitte geben Sie den Grund für die Meldung dieses Kommentars an. Wir werden Ihren Bericht überprüfen und erforderliche Maßnahmen ergreifen.",
        AppStrings.createNewProjectStepTwoCaptionForCourses:
            'Die Auswahl eines Kurses hilft Ihnen, für mehr Menschen sichtbar zu sein, die das gleiche Interesse oder Studienprogramm haben.',
        AppStrings.createNewProjectStepTwoCaptionForTeamMembers:
            'Sie können dem Projekt Teammitglieder hinzufügen, um Beiträge zu leisten und mehr.',
        AppStrings.createNewProjectStepTwoCaptionForLinks:
            'Die Links könnten auf der Projektseite angezeigt werden, wie GitHub, LinkedIn usw.',
        AppStrings.userForbidden: "Verboten",
        AppStrings.userForbiddenCaption: "Dieser Benutzer ist nicht aktiviert",
        AppStrings.userBlockedAdminCaption:
            "Dieser Benutzer wurde von einem Admin geblockt",
        AppStrings.tryAgain: 'Erneut versuchen',
        AppStrings.teamMember: "Mitglied",
        AppStrings.weakPassword:
            "Passwort ist schwach, bitte die Anforderungen erfüllen",
        AppStrings.emailShouldBeHHNHint:
            "Ihre E-Mail-Adresse sollte @hs-heilbronn.de oder @stud.hs-heilbronn.de sein",
        AppStrings.storageAccessFailed:
            "Konnte nicht auf den Speicher zugreifen",
        AppStrings.downloadFailed: "Download fehlgeschlagen",
        AppStrings.couldNotOpenDownloadedFile:
            "Konnte die heruntergeladene Datei nicht öffnen",
        AppStrings.faq: "FAQ",
        AppStrings.faq1:
            "Wohin gehen meine heruntergeladenen Materialien, nachdem ich auf Download geklickt habe?",
        AppStrings.faq1A: """
Downloads werden in der Regel im Speicher Ihres Geräts gespeichert:

Android: Dateien > Downloads > Materialien > {Name des Projekts}
iOS: Dateien-App > Downloads > Materialien > {Name des Projekts}
        """,
      };
}
