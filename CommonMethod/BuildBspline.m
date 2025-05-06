function curve=BuildBspline(ctrl_pts, k,point_num)
% BuildBspline - Construct and plot a B-spline curve using MATLAB built-in functions
%
% Inputs:
%   ctrl_pts - Control points, n x d matrix
%   k        - Degree of the B-spline (e.g., 3 for cubic)
%
% Example:
%   ctrl_pts = [0 0; 1 2; 3 5; 6 5; 7 3; 8 0];
%   BuildBspline(ctrl_pts, 3);

    % Number of control points
    n = size(ctrl_pts, 1);

    if k < 1 || k >= n
        error('Degree k must be >= 1 and < number of control points');
    end

    % Number of knots: n + k + 1
    % Use open uniform knot vector
    knots = augknt(linspace(0, 1, n - k + 1), k + 1);  % Open uniform

    % Build B-spline using spmak
    sp = spmak(knots, ctrl_pts');

    % Evaluate B-spline
    u = linspace(knots(1), knots(end), point_num);  % Valid domain
    curve = fnval(sp, u)';

    % Plot
    % figure; hold on; grid on;
    % plot(ctrl_pts(:,1), ctrl_pts(:,2), 'k--o', 'DisplayName', 'Control Polygon');
    % plot(curve(:,1), curve(:,2), 'b-', 'LineWidth', 2, 'DisplayName', 'B-spline Curve');
    % legend show;
    % title(sprintf('B-spline Curve of Degree %d (Built-in)', k));
    % xlabel('X'); ylabel('Y');
end

