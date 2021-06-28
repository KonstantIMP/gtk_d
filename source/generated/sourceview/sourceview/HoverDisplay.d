module sourceview.HoverDisplay;

private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class HoverDisplay : Widget
{
	/** the main Gtk struct */
	protected GtkSourceHoverDisplay* gtkSourceHoverDisplay;

	/** Get the main Gtk struct */
	public GtkSourceHoverDisplay* getHoverDisplayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceHoverDisplay;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceHoverDisplay;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceHoverDisplay* gtkSourceHoverDisplay, bool ownedRef = false)
	{
		this.gtkSourceHoverDisplay = gtkSourceHoverDisplay;
		super(cast(GtkWidget*)gtkSourceHoverDisplay, ownedRef);
	}

	/** */
	public override void insertAfter(Widget child, Widget sibling) {
		gtk_source_hover_display_insert_after(gtkSourceHoverDisplay, (child is null) ? null : child.getWidgetStruct(), (sibling is null) ? null : sibling.getWidgetStruct());
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return gtk_source_hover_display_get_type();
	}

	/** */
	public void append(Widget child)
	{
		gtk_source_hover_display_append(gtkSourceHoverDisplay, (child is null) ? null : child.getWidgetStruct());
	}

	/** */
	public void prepend(Widget child)
	{
		gtk_source_hover_display_prepend(gtkSourceHoverDisplay, (child is null) ? null : child.getWidgetStruct());
	}

	/** */
	public void remove(Widget child)
	{
		gtk_source_hover_display_remove(gtkSourceHoverDisplay, (child is null) ? null : child.getWidgetStruct());
	}
}
