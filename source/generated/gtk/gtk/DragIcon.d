module gtk.DragIcon;

private import gdk.Drag;
private import gdk.PaintableIF;
private import gobject.ObjectG;
private import gobject.Value;
private import gtk.NativeIF;
private import gtk.NativeT;
private import gtk.RootIF;
private import gtk.RootT;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkDragIcon` is a `GtkRoot` implementation for drag icons.
 * 
 * A drag icon moves with the pointer during a Drag-and-Drop operation
 * and is destroyed when the drag ends.
 * 
 * To set up a drag icon and associate it with an ongoing drag operation,
 * use [func@Gtk.DragIcon.get_for_drag] to get the icon for a drag. You can
 * then use it like any other widget and use [method@Gtk.DragIcon.set_child]
 * to set whatever widget should be used for the drag icon.
 * 
 * Keep in mind that drag icons do not allow user input.
 */
public class DragIcon : Widget, NativeIF, RootIF
{
	/** the main Gtk struct */
	protected GtkDragIcon* gtkDragIcon;

	/** Get the main Gtk struct */
	public GtkDragIcon* getDragIconStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkDragIcon;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkDragIcon;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkDragIcon* gtkDragIcon, bool ownedRef = false)
	{
		this.gtkDragIcon = gtkDragIcon;
		super(cast(GtkWidget*)gtkDragIcon, ownedRef);
	}

	// add the Native capabilities
	mixin NativeT!(GtkDragIcon);

	// add the Root capabilities
	mixin RootT!(GtkDragIcon);


	/** */
	public static GType getType()
	{
		return gtk_drag_icon_get_type();
	}

	/**
	 * Creates a widget that can be used as a drag icon for the given
	 * @value.
	 *
	 * Supported types include strings, `GdkRGBA` and `GtkTextBuffer`.
	 * If GTK does not know how to create a widget for a given value,
	 * it will return %NULL.
	 *
	 * This method is used to set the default drag icon on drag-and-drop
	 * operations started by `GtkDragSource`, so you don't need to set
	 * a drag icon using this function there.
	 *
	 * Params:
	 *     value = a `GValue`
	 *
	 * Returns: A new `GtkWidget`
	 *     for displaying @value as a drag icon.
	 */
	public static Widget createWidgetForValue(Value value)
	{
		auto __p = gtk_drag_icon_create_widget_for_value((value is null) ? null : value.getValueStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p, true);
	}

	/**
	 * Gets the `GtkDragIcon` in use with @drag.
	 *
	 * If no drag icon exists yet, a new one will be created
	 * and shown.
	 *
	 * Params:
	 *     drag = a `GdkDrag`
	 *
	 * Returns: the `GtkDragIcon`
	 */
	public static Widget getForDrag(Drag drag)
	{
		auto __p = gtk_drag_icon_get_for_drag((drag is null) ? null : drag.getDragStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Creates a `GtkDragIcon` that shows @paintable, and associates
	 * it with the drag operation.
	 *
	 * The hotspot position on the paintable is aligned with the
	 * hotspot of the cursor.
	 *
	 * Params:
	 *     drag = a `GdkDrag`
	 *     paintable = a `GdkPaintable` to display
	 *     hotX = X coordinate of the hotspot
	 *     hotY = Y coordinate of the hotspot
	 */
	public static void setFromPaintable(Drag drag, PaintableIF paintable, int hotX, int hotY)
	{
		gtk_drag_icon_set_from_paintable((drag is null) ? null : drag.getDragStruct(), (paintable is null) ? null : paintable.getPaintableStruct(), hotX, hotY);
	}

	/**
	 * Gets the widget currently used as drag icon.
	 *
	 * Returns: The drag icon
	 */
	public Widget getChild()
	{
		auto __p = gtk_drag_icon_get_child(gtkDragIcon);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Sets the widget to display as the drag icon.
	 *
	 * Params:
	 *     child = a `GtkWidget`
	 */
	public void setChild(Widget child)
	{
		gtk_drag_icon_set_child(gtkDragIcon, (child is null) ? null : child.getWidgetStruct());
	}
}
