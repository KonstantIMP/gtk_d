module gtk.AccessibleIF;

private import gobject.Value;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkAccessible` is an interface for describing UI elements for
 * Assistive Technologies.
 * 
 * Every accessible implementation has:
 * 
 * - a “role”, represented by a value of the [enum@Gtk.AccessibleRole] enumeration
 * - an “attribute”, represented by a set of [enum@Gtk.AccessibleState],
 * [enum@Gtk.AccessibleProperty] and [enum@Gtk.AccessibleRelation] values
 * 
 * The role cannot be changed after instantiating a `GtkAccessible`
 * implementation.
 * 
 * The attributes are updated every time a UI element's state changes in
 * a way that should be reflected by assistive technologies. For instance,
 * if a `GtkWidget` visibility changes, the %GTK_ACCESSIBLE_STATE_HIDDEN
 * state will also change to reflect the [property@Gtk.Widget:visible] property.
 */
public interface AccessibleIF{
	/** Get the main Gtk struct */
	public GtkAccessible* getAccessibleStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_accessible_get_type();
	}

	/**
	 * Retrieves the `GtkAccessibleRole` for the given `GtkAccessible`.
	 *
	 * Returns: a `GtkAccessibleRole`
	 */
	public GtkAccessibleRole getAccessibleRole();

	/**
	 * Resets the accessible @property to its default value.
	 *
	 * Params:
	 *     property = a `GtkAccessibleProperty`
	 */
	public void resetProperty(GtkAccessibleProperty property);

	/**
	 * Resets the accessible @relation to its default value.
	 *
	 * Params:
	 *     relation = a `GtkAccessibleRelation`
	 */
	public void resetRelation(GtkAccessibleRelation relation);

	/**
	 * Resets the accessible @state to its default value.
	 *
	 * Params:
	 *     state = a `GtkAccessibleState`
	 */
	public void resetState(GtkAccessibleState state);

	/**
	 * Updates an array of accessible properties.
	 *
	 * This function should be called by `GtkWidget` types whenever an accessible
	 * property change must be communicated to assistive technologies.
	 *
	 * This function is meant to be used by language bindings.
	 *
	 * Params:
	 *     properties = an array of `GtkAccessibleProperty`
	 *     values = an array of `GValues`, one for each property
	 */
	public void updatePropertyValue(GtkAccessibleProperty[] properties, Value[] values);

	/**
	 * Updates an array of accessible relations.
	 *
	 * This function should be called by `GtkWidget` types whenever an accessible
	 * relation change must be communicated to assistive technologies.
	 *
	 * This function is meant to be used by language bindings.
	 *
	 * Params:
	 *     relations = an array of `GtkAccessibleRelation`
	 *     values = an array of `GValues`, one for each relation
	 */
	public void updateRelationValue(GtkAccessibleRelation[] relations, Value[] values);

	/**
	 * Updates an array of accessible states.
	 *
	 * This function should be called by `GtkWidget` types whenever an accessible
	 * state change must be communicated to assistive technologies.
	 *
	 * This function is meant to be used by language bindings.
	 *
	 * Params:
	 *     states = an array of `GtkAccessibleState`
	 *     values = an array of `GValues`, one for each state
	 */
	public void updateStateValue(GtkAccessibleState[] states, Value[] values);
}
