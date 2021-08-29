module gtk.Paned;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * `GtkPaned` has two panes, arranged either horizontally or vertically.
 * 
 * ![An example GtkPaned](panes.png)
 * 
 * The division between the two panes is adjustable by the user
 * by dragging a handle.
 * 
 * Child widgets are added to the panes of the widget with
 * [method@Gtk.Paned.set_start_child] and [method@Gtk.Paned.set_end_child].
 * The division between the two children is set by default from the size
 * requests of the children, but it can be adjusted by the user.
 * 
 * A paned widget draws a separator between the two child widgets and a
 * small handle that the user can drag to adjust the division. It does not
 * draw any relief around the children or around the separator. (The space
 * in which the separator is called the gutter.) Often, it is useful to put
 * each child inside a [class@Gtk.Frame] so that the gutter appears as a
 * ridge. No separator is drawn if one of the children is missing.
 * 
 * Each child has two options that can be set, @resize and @shrink. If
 * @resize is true, then when the `GtkPaned` is resized, that child will
 * expand or shrink along with the paned widget. If @shrink is true, then
 * that child can be made smaller than its requisition by the user.
 * Setting @shrink to %FALSE allows the application to set a minimum size.
 * If @resize is false for both children, then this is treated as if
 * @resize is true for both children.
 * 
 * The application can set the position of the slider as if it were set
 * by the user, by calling [method@Gtk.Paned.set_position].
 * 
 * # CSS nodes
 * 
 * ```
 * paned
 * ├── <child>
 * ├── separator[.wide]
 * ╰── <child>
 * ```
 * 
 * `GtkPaned` has a main CSS node with name paned, and a subnode for
 * the separator with name separator. The subnode gets a .wide style
 * class when the paned is supposed to be wide.
 * 
 * In horizontal orientation, the nodes are arranged based on the text
 * direction, so in left-to-right mode, :first-child will select the
 * leftmost child, while it will select the rightmost child in
 * RTL layouts.
 * 
 * ## Creating a paned widget with minimum sizes.
 * 
 * ```c
 * GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
 * GtkWidget *frame1 = gtk_frame_new (NULL);
 * GtkWidget *frame2 = gtk_frame_new (NULL);
 * 
 * gtk_widget_set_size_request (hpaned, 200, -1);
 * 
 * gtk_paned_set_start_child (GTK_PANED (hpaned), frame1);
 * gtk_paned_set_start_child_resize (GTK_PANED (hpaned), TRUE);
 * gtk_paned_set_start_child_shrink (GTK_PANED (hpaned), FALSE);
 * gtk_widget_set_size_request (frame1, 50, -1);
 * 
 * gtk_paned_set_end_child (GTK_PANED (hpaned), frame2);
 * gtk_paned_set_end_child_resize (GTK_PANED (hpaned), FALSE);
 * gtk_paned_set_end_child_shrink (GTK_PANED (hpaned), FALSE);
 * gtk_widget_set_size_request (frame2, 50, -1);
 * ```
 */
public class Paned : Widget, OrientableIF
{
	/** the main Gtk struct */
	protected GtkPaned* gtkPaned;

	/** Get the main Gtk struct */
	public GtkPaned* getPanedStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkPaned;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkPaned;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkPaned* gtkPaned, bool ownedRef = false)
	{
		this.gtkPaned = gtkPaned;
		super(cast(GtkWidget*)gtkPaned, ownedRef);
	}

	// add the Orientable capabilities
	mixin OrientableT!(GtkPaned);


	/** */
	public static GType getType()
	{
		return gtk_paned_get_type();
	}

	/**
	 * Creates a new `GtkPaned` widget.
	 *
	 * Params:
	 *     orientation = the paned’s orientation.
	 *
	 * Returns: a new `GtkPaned`.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GtkOrientation orientation)
	{
		auto __p = gtk_paned_new(orientation);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkPaned*) __p);
	}

	/**
	 * Retrieves the end child of the given `GtkPaned`.
	 *
	 * See also: `GtkPaned`:end-child
	 *
	 * Returns: the end child widget
	 */
	public Widget getEndChild()
	{
		auto __p = gtk_paned_get_end_child(gtkPaned);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Obtains the position of the divider between the two panes.
	 *
	 * Returns: position of the divider
	 */
	public int getPosition()
	{
		return gtk_paned_get_position(gtkPaned);
	}

	/**
	 * Returns whether the end child can be resized.
	 *
	 * Returns: %TRUE if the end child is resizable
	 */
	public bool getResizeEndChild()
	{
		return gtk_paned_get_resize_end_child(gtkPaned) != 0;
	}

	/**
	 * Returns whether the start child can be resized.
	 *
	 * Returns: %TRUE if the start child is resizable
	 */
	public bool getResizeStartChild()
	{
		return gtk_paned_get_resize_start_child(gtkPaned) != 0;
	}

	/**
	 * Returns whether the end child can be shrunk.
	 *
	 * Returns: %TRUE if the end child is shrinkable
	 */
	public bool getShrinkEndChild()
	{
		return gtk_paned_get_shrink_end_child(gtkPaned) != 0;
	}

	/**
	 * Returns whether the start child can be shrunk.
	 *
	 * Returns: %TRUE if the start child is shrinkable
	 */
	public bool getShrinkStartChild()
	{
		return gtk_paned_get_shrink_start_child(gtkPaned) != 0;
	}

	/**
	 * Retrieves the start child of the given `GtkPaned`.
	 *
	 * See also: `GtkPaned`:start-child
	 *
	 * Returns: the start child widget
	 */
	public Widget getStartChild()
	{
		auto __p = gtk_paned_get_start_child(gtkPaned);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Gets whether the separator should be wide.
	 *
	 * Returns: %TRUE if the paned should have a wide handle
	 */
	public bool getWideHandle()
	{
		return gtk_paned_get_wide_handle(gtkPaned) != 0;
	}

	/**
	 * Sets the end child of @paned to @child.
	 *
	 * Params:
	 *     child = the widget to add
	 */
	public void setEndChild(Widget child)
	{
		gtk_paned_set_end_child(gtkPaned, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Sets the position of the divider between the two panes.
	 *
	 * Params:
	 *     position = pixel position of divider, a negative value means that the position
	 *         is unset
	 */
	public void setPosition(int position)
	{
		gtk_paned_set_position(gtkPaned, position);
	}

	/**
	 * Sets the `GtkPaned`:resize-end-child property
	 *
	 * Params:
	 *     resize = %TRUE to let the end child be resized
	 */
	public void setResizeEndChild(bool resize)
	{
		gtk_paned_set_resize_end_child(gtkPaned, resize);
	}

	/**
	 * Sets the `GtkPaned`:resize-start-child property
	 *
	 * Params:
	 *     resize = %TRUE to let the start child be resized
	 */
	public void setResizeStartChild(bool resize)
	{
		gtk_paned_set_resize_start_child(gtkPaned, resize);
	}

	/**
	 * Sets the `GtkPaned`:shrink-end-child property
	 *
	 * Params:
	 *     resize = %TRUE to let the end child be shrunk
	 */
	public void setShrinkEndChild(bool resize)
	{
		gtk_paned_set_shrink_end_child(gtkPaned, resize);
	}

	/**
	 * Sets the `GtkPaned`:shrink-start-child property
	 *
	 * Params:
	 *     resize = %TRUE to let the start child be shrunk
	 */
	public void setShrinkStartChild(bool resize)
	{
		gtk_paned_set_shrink_start_child(gtkPaned, resize);
	}

	/**
	 * Sets the start child of @paned to @child.
	 *
	 * Params:
	 *     child = the widget to add
	 */
	public void setStartChild(Widget child)
	{
		gtk_paned_set_start_child(gtkPaned, (child is null) ? null : child.getWidgetStruct());
	}

	/**
	 * Sets whether the separator should be wide.
	 *
	 * Params:
	 *     wide = the new value for the [property@Gtk.Paned:wide-handle] property
	 */
	public void setWideHandle(bool wide)
	{
		gtk_paned_set_wide_handle(gtkPaned, wide);
	}

	/**
	 * Emitted to accept the current position of the handle when
	 * moving it using key bindings.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * The default binding for this signal is Return or Space.
	 */
	gulong addOnAcceptPosition(bool delegate(Paned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "accept-position", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted to cancel moving the position of the handle using key
	 * bindings.
	 *
	 * The position of the handle will be reset to the value prior to
	 * moving it.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * The default binding for this signal is Escape.
	 */
	gulong addOnCancelPosition(bool delegate(Paned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "cancel-position", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted to cycle the focus between the children of the paned.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * The default binding is F6.
	 *
	 * Params:
	 *     reversed = whether cycling backward or forward
	 */
	gulong addOnCycleChildFocus(bool delegate(bool, Paned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "cycle-child-focus", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted to cycle whether the paned should grab focus to allow
	 * the user to change position of the handle by using key bindings.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * The default binding for this signal is F8.
	 *
	 * Params:
	 *     reversed = whether cycling backward or forward
	 */
	gulong addOnCycleHandleFocus(bool delegate(bool, Paned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "cycle-handle-focus", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted to move the handle with key bindings.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * Params:
	 *     scrollType = a `GtkScrollType`
	 */
	gulong addOnMoveHandle(bool delegate(GtkScrollType, Paned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "move-handle", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted to accept the current position of the handle and then
	 * move focus to the next widget in the focus chain.
	 *
	 * This is a [keybinding signal](class.SignalAction.html).
	 *
	 * The default binding is Tab.
	 */
	gulong addOnToggleHandleFocus(bool delegate(Paned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "toggle-handle-focus", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
