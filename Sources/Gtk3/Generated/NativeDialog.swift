import CGtk3

/// Native dialogs are platform dialogs that don't use #GtkDialog or
/// #GtkWindow. They are used in order to integrate better with a
/// platform, by looking the same as other native applications and
/// supporting platform specific features.
///
/// The #GtkDialog functions cannot be used on such objects, but we
/// need a similar API in order to drive them. The #GtkNativeDialog
/// object is an API that allows you to do this. It allows you to set
/// various common properties on the dialog, as well as show and hide
/// it and get a #GtkNativeDialog::response signal when the user finished
/// with the dialog.
///
/// There is also a gtk_native_dialog_run() helper that makes it easy
/// to run any native dialog in a modal way with a recursive mainloop,
/// similar to gtk_dialog_run().
open class NativeDialog: GObject {

    public override func registerSignals() {
        super.registerSignals()

        let handler0:
            @convention(c) (UnsafeMutableRawPointer, Int, UnsafeMutableRawPointer) -> Void =
                { _, value1, data in
                    SignalBox1<Int>.run(data, value1)
                }

        addSignal(name: "response", handler: gCallback(handler0)) { [weak self] (param0: Int) in
            guard let self = self else { return }
            self.response?(self, param0)
        }

        let handler1:
            @convention(c) (UnsafeMutableRawPointer, OpaquePointer, UnsafeMutableRawPointer) -> Void =
                { _, value1, data in
                    SignalBox1<OpaquePointer>.run(data, value1)
                }

        addSignal(name: "notify::modal", handler: gCallback(handler1)) {
            [weak self] (param0: OpaquePointer) in
            guard let self = self else { return }
            self.notifyModal?(self, param0)
        }

        let handler2:
            @convention(c) (UnsafeMutableRawPointer, OpaquePointer, UnsafeMutableRawPointer) -> Void =
                { _, value1, data in
                    SignalBox1<OpaquePointer>.run(data, value1)
                }

        addSignal(name: "notify::title", handler: gCallback(handler2)) {
            [weak self] (param0: OpaquePointer) in
            guard let self = self else { return }
            self.notifyTitle?(self, param0)
        }

        let handler3:
            @convention(c) (UnsafeMutableRawPointer, OpaquePointer, UnsafeMutableRawPointer) -> Void =
                { _, value1, data in
                    SignalBox1<OpaquePointer>.run(data, value1)
                }

        addSignal(name: "notify::transient-for", handler: gCallback(handler3)) {
            [weak self] (param0: OpaquePointer) in
            guard let self = self else { return }
            self.notifyTransientFor?(self, param0)
        }

        let handler4:
            @convention(c) (UnsafeMutableRawPointer, OpaquePointer, UnsafeMutableRawPointer) -> Void =
                { _, value1, data in
                    SignalBox1<OpaquePointer>.run(data, value1)
                }

        addSignal(name: "notify::visible", handler: gCallback(handler4)) {
            [weak self] (param0: OpaquePointer) in
            guard let self = self else { return }
            self.notifyVisible?(self, param0)
        }
    }

    /// Emitted when the user responds to the dialog.
    ///
    /// When this is called the dialog has been hidden.
    ///
    /// If you call gtk_native_dialog_hide() before the user responds to
    /// the dialog this signal will not be emitted.
    public var response: ((NativeDialog, Int) -> Void)?

    public var notifyModal: ((NativeDialog, OpaquePointer) -> Void)?

    public var notifyTitle: ((NativeDialog, OpaquePointer) -> Void)?

    public var notifyTransientFor: ((NativeDialog, OpaquePointer) -> Void)?

    public var notifyVisible: ((NativeDialog, OpaquePointer) -> Void)?
}
