module gdk.PopupIF;

private import gdk.PopupLayout;
private import gdk.Surface;
private import gdk.c.functions;
public  import gdk.c.types;
private import gobject.ObjectG;


/**
 * A `GdkPopup` is a surface that is attached to another surface.
 * 
 * The `GdkPopup` is positioned relative to its parent surface.
 * 
 * `GdkPopup`s are typically used to implement menus and similar popups.
 * They can be modal, which is indicated by the [property@GdkPopup:autohide]
 * property.
 */
public interface PopupIF{
	/** Get the main Gtk struct */
	public GdkPopup* getPopupStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gdk_popup_get_type();
	}

	/**
	 * Returns whether this popup is set to hide on outside clicks.
	 *
	 * Returns: %TRUE if @popup will autohide
	 */
	public bool getAutohide();

	/**
	 * Returns the parent surface of a popup.
	 *
	 * Returns: the parent surface
	 */
	public Surface getParent();

	/**
	 * Obtains the position of the popup relative to its parent.
	 *
	 * Returns: the X coordinate of @popup position
	 */
	public int getPositionX();

	/**
	 * Obtains the position of the popup relative to its parent.
	 *
	 * Returns: the Y coordinate of @popup position
	 */
	public int getPositionY();

	/**
	 * Gets the current popup rectangle anchor.
	 *
	 * The value returned may change after calling [method@Gdk.Popup.present],
	 * or after the [signal@Gdk.Surface::layout] signal is emitted.
	 *
	 * Returns: the current rectangle anchor value of @popup
	 */
	public GdkGravity getRectAnchor();

	/**
	 * Gets the current popup surface anchor.
	 *
	 * The value returned may change after calling [method@Gdk.Popup.present],
	 * or after the [signal@Gdk.Surface::layout] signal is emitted.
	 *
	 * Returns: the current surface anchor value of @popup
	 */
	public GdkGravity getSurfaceAnchor();

	/**
	 * Present @popup after having processed the `GdkPopupLayout` rules.
	 *
	 * If the popup was previously now showing, it will be showed,
	 * otherwise it will change position according to @layout.
	 *
	 * After calling this function, the result should be handled in response
	 * to the [signal@GdkSurface::layout] signal being emitted. The resulting
	 * popup position can be queried using [method@Gdk.Popup.get_position_x],
	 * [method@Gdk.Popup.get_position_y], and the resulting size will be sent as
	 * parameters in the layout signal. Use [method@Gdk.Popup.get_rect_anchor]
	 * and [method@Gdk.Popup.get_surface_anchor] to get the resulting anchors.
	 *
	 * Presenting may fail, for example if the @popup is set to autohide
	 * and is immediately hidden upon being presented. If presenting failed,
	 * the [signal@Gdk.Surface::layout] signal will not me emitted.
	 *
	 * Params:
	 *     width = the unconstrained popup width to layout
	 *     height = the unconstrained popup height to layout
	 *     layout = the `GdkPopupLayout` object used to layout
	 *
	 * Returns: %FALSE if it failed to be presented, otherwise %TRUE.
	 */
	public bool present(int width, int height, PopupLayout layout);
}
