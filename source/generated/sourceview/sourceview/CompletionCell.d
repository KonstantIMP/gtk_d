module sourceview.CompletionCell;

private import gdk.PaintableIF;
private import gio.IconIF;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import pango.PgAttributeList;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class CompletionCell : Widget
{
	/** the main Gtk struct */
	protected GtkSourceCompletionCell* gtkSourceCompletionCell;

	/** Get the main Gtk struct */
	public GtkSourceCompletionCell* getCompletionCellStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceCompletionCell;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceCompletionCell;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceCompletionCell* gtkSourceCompletionCell, bool ownedRef = false)
	{
		this.gtkSourceCompletionCell = gtkSourceCompletionCell;
		super(cast(GtkWidget*)gtkSourceCompletionCell, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_completion_cell_get_type();
	}

	/** */
	public GtkSourceCompletionColumn getColumn()
	{
		return gtk_source_completion_cell_get_column(gtkSourceCompletionCell);
	}

	/**
	 * Gets the child #GtkWidget, if any.
	 *
	 * Returns: a #GtkWidget or %NULL
	 *
	 * Since: 5.0
	 */
	public Widget getWidget()
	{
		auto __p = gtk_source_completion_cell_get_widget(gtkSourceCompletionCell);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/** */
	public void setGicon(IconIF gicon)
	{
		gtk_source_completion_cell_set_gicon(gtkSourceCompletionCell, (gicon is null) ? null : gicon.getIconStruct());
	}

	/** */
	public void setIconName(string iconName)
	{
		gtk_source_completion_cell_set_icon_name(gtkSourceCompletionCell, Str.toStringz(iconName));
	}

	/** */
	public void setMarkup(string markup)
	{
		gtk_source_completion_cell_set_markup(gtkSourceCompletionCell, Str.toStringz(markup));
	}

	/** */
	public void setPaintable(PaintableIF paintable)
	{
		gtk_source_completion_cell_set_paintable(gtkSourceCompletionCell, (paintable is null) ? null : paintable.getPaintableStruct());
	}

	/** */
	public void setText(string text)
	{
		gtk_source_completion_cell_set_text(gtkSourceCompletionCell, Str.toStringz(text));
	}

	/** */
	public void setTextWithAttributes(string text, PgAttributeList attrs)
	{
		gtk_source_completion_cell_set_text_with_attributes(gtkSourceCompletionCell, Str.toStringz(text), (attrs is null) ? null : attrs.getPgAttributeListStruct());
	}

	/** */
	public void setWidget(Widget child)
	{
		gtk_source_completion_cell_set_widget(gtkSourceCompletionCell, (child is null) ? null : child.getWidgetStruct());
	}
}
