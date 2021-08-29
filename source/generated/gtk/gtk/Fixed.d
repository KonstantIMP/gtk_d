module gtk.Fixed;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.Transform;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkFixed` places its child widgets at fixed positions and with fixed sizes.
 * 
 * `GtkFixed` performs no automatic layout management.
 * 
 * For most applications, you should not use this container! It keeps
 * you from having to learn about the other GTK containers, but it
 * results in broken applications.  With `GtkFixed`, the following
 * things will result in truncated text, overlapping widgets, and
 * other display bugs:
 * 
 * - Themes, which may change widget sizes.
 * 
 * - Fonts other than the one you used to write the app will of course
 * change the size of widgets containing text; keep in mind that
 * users may use a larger font because of difficulty reading the
 * default, or they may be using a different OS that provides different fonts.
 * 
 * - Translation of text into other languages changes its size. Also,
 * display of non-English text will use a different font in many
 * cases.
 * 
 * In addition, `GtkFixed` does not pay attention to text direction and
 * thus may produce unwanted results if your app is run under right-to-left
 * languages such as Hebrew or Arabic. That is: normally GTK will order
 * containers appropriately for the text direction, e.g. to put labels to
 * the right of the thing they label when using an RTL language, but it can’t
 * do that with `GtkFixed`. So if you need to reorder widgets depending on
 * the text direction, you would need to manually detect it and adjust child
 * positions accordingly.
 * 
 * Finally, fixed positioning makes it kind of annoying to add/remove
 * UI elements, since you have to reposition all the other elements. This
 * is a long-term maintenance problem for your application.
 * 
 * If you know none of these things are an issue for your application,
 * and prefer the simplicity of `GtkFixed`, by all means use the
 * widget. But you should be aware of the tradeoffs.
 */
public class Fixed : Widget
{
	/** the main Gtk struct */
	protected GtkFixed* gtkFixed;

	/** Get the main Gtk struct */
	public GtkFixed* getFixedStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFixed;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFixed;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFixed* gtkFixed, bool ownedRef = false)
	{
		this.gtkFixed = gtkFixed;
		super(cast(GtkWidget*)gtkFixed, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_fixed_get_type();
	}

	/**
	 * Creates a new `GtkFixed`.
	 *
	 * Returns: a new `GtkFixed`.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_fixed_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFixed*) __p);
	}

	/**
	 * Retrieves the translation transformation of the
	 * given child `GtkWidget` in the `GtkFixed`.
	 *
	 * See also: [method@Gtk.Fixed.get_child_transform].
	 *
	 * Params:
	 *     widget = a child of @fixed
	 *     x = the horizontal position of the @widget
	 *     y = the vertical position of the @widget
	 */
	public void getChildPosition(Widget widget, out double x, out double y)
	{
		gtk_fixed_get_child_position(gtkFixed, (widget is null) ? null : widget.getWidgetStruct(), &x, &y);
	}

	/**
	 * Retrieves the transformation for @widget set using
	 * gtk_fixed_set_child_transform().
	 *
	 * Params:
	 *     widget = a `GtkWidget`, child of @fixed
	 *
	 * Returns: a `GskTransform`
	 */
	public Transform getChildTransform(Widget widget)
	{
		auto __p = gtk_fixed_get_child_transform(gtkFixed, (widget is null) ? null : widget.getWidgetStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p);
	}

	/**
	 * Sets a translation transformation to the given @x and @y
	 * coordinates to the child @widget of the `GtkFixed`.
	 *
	 * Params:
	 *     widget = the child widget
	 *     x = the horizontal position to move the widget to
	 *     y = the vertical position to move the widget to
	 */
	public void move(Widget widget, double x, double y)
	{
		gtk_fixed_move(gtkFixed, (widget is null) ? null : widget.getWidgetStruct(), x, y);
	}

	/**
	 * Adds a widget to a `GtkFixed` at the given position.
	 *
	 * Params:
	 *     widget = the widget to add
	 *     x = the horizontal position to place the widget at
	 *     y = the vertical position to place the widget at
	 */
	public void put(Widget widget, double x, double y)
	{
		gtk_fixed_put(gtkFixed, (widget is null) ? null : widget.getWidgetStruct(), x, y);
	}

	/**
	 * Removes a child from @fixed.
	 *
	 * Params:
	 *     widget = the child widget to remove
	 */
	public void remove(Widget widget)
	{
		gtk_fixed_remove(gtkFixed, (widget is null) ? null : widget.getWidgetStruct());
	}

	/**
	 * Sets the transformation for @widget.
	 *
	 * This is a convenience function that retrieves the
	 * [class@Gtk.FixedLayoutChild] instance associated to
	 * @widget and calls [method@Gtk.FixedLayoutChild.set_transform].
	 *
	 * Params:
	 *     widget = a `GtkWidget`, child of @fixed
	 *     transform = the transformation assigned to @widget
	 *         to reset @widget's transform
	 */
	public void setChildTransform(Widget widget, Transform transform)
	{
		gtk_fixed_set_child_transform(gtkFixed, (widget is null) ? null : widget.getWidgetStruct(), (transform is null) ? null : transform.getTransformStruct());
	}
}
