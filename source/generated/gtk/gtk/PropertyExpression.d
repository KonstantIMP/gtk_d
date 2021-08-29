module gtk.PropertyExpression;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.ParamSpec;
private import gtk.Expression;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GObject` property value in a `GtkExpression`.
 */
public class PropertyExpression : Expression
{
	/** the main Gtk struct */
	protected GtkPropertyExpression* gtkPropertyExpression;

	/** Get the main Gtk struct */
	public GtkPropertyExpression* getPropertyExpressionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkPropertyExpression;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkPropertyExpression;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkPropertyExpression* gtkPropertyExpression, bool ownedRef = false)
	{
		this.gtkPropertyExpression = gtkPropertyExpression;
		super(cast(GtkExpression*)gtkPropertyExpression, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_property_expression_get_type();
	}

	/**
	 * Creates an expression that looks up a property.
	 *
	 * The object to use is found by evaluating the `expression`,
	 * or using the `this` argument when `expression` is `NULL`.
	 *
	 * If the resulting object conforms to `this_type`, its property named
	 * `property_name` will be queried. Otherwise, this expression's
	 * evaluation will fail.
	 *
	 * The given `this_type` must have a property with `property_name`.
	 *
	 * Params:
	 *     thisType = The type to expect for the this type
	 *     expression = Expression to
	 *         evaluate to get the object to query or `NULL` to
	 *         query the `this` object
	 *     propertyName = name of the property
	 *
	 * Returns: a new `GtkExpression`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType thisType, Expression expression, string propertyName)
	{
		auto __p = gtk_property_expression_new(thisType, (expression is null) ? null : expression.getExpressionStruct(true), Str.toStringz(propertyName));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkPropertyExpression*) __p);
	}

	/**
	 * Creates an expression that looks up a property.
	 *
	 * The object to use is found by evaluating the `expression`,
	 * or using the `this` argument when `expression` is `NULL`.
	 *
	 * If the resulting object conforms to `this_type`, its
	 * property specified by `pspec` will be queried.
	 * Otherwise, this expression's evaluation will fail.
	 *
	 * Params:
	 *     expression = Expression to
	 *         evaluate to get the object to query or `NULL` to
	 *         query the `this` object
	 *     pspec = the `GParamSpec` for the property to query
	 *
	 * Returns: a new `GtkExpression`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Expression expression, ParamSpec pspec)
	{
		auto __p = gtk_property_expression_new_for_pspec((expression is null) ? null : expression.getExpressionStruct(true), (pspec is null) ? null : pspec.getParamSpecStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_for_pspec");
		}

		this(cast(GtkPropertyExpression*) __p);
	}

	/**
	 * Gets the expression specifying the object of
	 * a property expression.
	 *
	 * Returns: the object expression
	 */
	public Expression getExpression()
	{
		auto __p = gtk_property_expression_get_expression(cast(GtkExpression*)gtkPropertyExpression);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Expression)(cast(GtkExpression*) __p);
	}

	/**
	 * Gets the `GParamSpec` specifying the property of
	 * a property expression.
	 *
	 * Returns: the `GParamSpec` for the property
	 */
	public ParamSpec getPspec()
	{
		auto __p = gtk_property_expression_get_pspec(cast(GtkExpression*)gtkPropertyExpression);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ParamSpec)(cast(GParamSpec*) __p);
	}
}
